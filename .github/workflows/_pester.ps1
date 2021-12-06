$PesterConfig = New-PesterConfiguration

$PesterConfig.Run.Path = './test'
$PesterConfig.Run.Exit = $true
$PesterConfig.Run.PassThru = $true

$PesterConfig.TestResult.Enabled = $true
$PesterConfig.TestResult.OutputFormat = 'JUnitXml'
$PesterConfig.TestResult.OutputPath = 'TestResults.xml'

$PesterConfig.CodeCoverage.Enabled = $true
$PesterConfig.CodeCoverage.OutputFormat = 'JaCoCo'
$PesterConfig.CodeCoverage.OutputPath = 'CoverageResults.xml'
$PesterConfig.CodeCoverage.Path = './src'
$PesterConfig.CodeCoverage.RecursePaths = $true

$PesterConfig.Output.Verbosity = 'Detailed'

$PesterResult = Invoke-Pester -Configuration $PesterConfig
