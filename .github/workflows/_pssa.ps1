$ExcludedRules = @(
    'PSAvoidGlobalVars'
)

$PssaSplat = @{
    Path          = './src'
    Recurse       = $true
    EnableExit    = $true
    ReportSummary = $true
    ExcludeRule   = $ExcludedRules
    Severity      = @()
}

Invoke-ScriptAnalyzer @PssaSplat
