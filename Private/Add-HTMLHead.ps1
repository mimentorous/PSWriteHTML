function Add-HTMLHead {
    [CmdletBinding()]
    param(
        [string] $TitleText,
        [switch] $UseStyleLinks,
        [switch] $UseCssLinks,
        [switch] $AddAuthor,
        [switch] $HideTitle,
        $Options
    )
   # [string] $CurrentDate = (Get-Date).ToString($DateFormat)

    # Replace PNG / JPG files in Styles
    if ($null -ne $Options.StyleContent) {

        Write-Verbose "Logos: $($Options.Logos.Keys -join ',')"
        foreach ($Logo in $Options.Logos.Keys) {
            $Search = "../images/$Logo.png", "DataTables-1.10.18/images/$Logo.png"
            $Replace = $Options.Logos[$Logo]
            foreach ($S in $Search) {
                Write-Verbose "Logos - replacing $S with binary representation"
                $Options.StyleContent = ($Options.StyleContent).Replace($S, $Replace)
            }
        }
    }

    #$HTML = New-GenericList -Type [string]
    #if ($AddAuthor) {
    #    if ([String]::IsNullOrWhiteSpace($Author)) {
    #        $Author = $env:USERNAME
    #    }
    #    $HTML.Add("<!--- This page was autogenerated $CurrentDate By $Author -->")
    #}
    #if (-not $HideTitle) {
    #    $HTML.Add("<Title>$TitleText</Title>")
    #}
    #$HTML.Add("<!-- Styles -->")
    #$HTML.Add("$($Options.StyleContent)")
    #$HTML.Add('<!-- Scripts -->')
    #$HTML.Add("$($Options.ScriptContent)")
    #$HTML.Add('')

    #return $HTML
}