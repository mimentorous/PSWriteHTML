Import-Module PSWriteHTML -Force

$Time = Start-TimeLog

$ReportTitle = 'Test'

$ReportPath = "$PSScriptRoot\Example4.html"

$DomainAdminTable = Get-ADForest | Select-Object ForestMode, Name, RootDomain, SchemaMaster
$EnterpriseAdminTable = Get-ADuser -Filter * | Select-Object Name, Surname, Enabled, DisplayName
$Allusers = Get-AdUser -Filter *

$TabNames = 'Dashboard', 'Something'

$Report = New-HTML -TitleText $ReportTitle -HideLogos -AddAuthor -HideDate -UseCssLinks -UseStyleLinks -Verbose {
    New-HTMLTabHeader -TabNames $TabNames
    New-HTMLTab -TabName 'Dashboard' {
        New-HTMLHeading -Heading h3 -HeadingText 'This is a test'
        New-HTMLContent -HeaderText "Groups" {
            New-HTMLHeading -Heading h3 -HeadingText 'This is a test'
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable -Verbose -Simplify
            }
            New-HTMLContent -HeaderText 'Domain Administrators' -CanCollapse {
                New-HTMLTable -DataTable $EnterpriseAdminTable -Verbose
            }
        }
    }
}
Save-HTML -HTML $Report -FilePath $ReportPath -ShowHTML
Stop-TimeLog -Time $Time -Option OneLiner