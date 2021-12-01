$RelevantFiles = (Get-ChildItem './src' -Recurse -Include '*.ps1').FullName

$PesterSplat = @{
    Path                         = './test'
    OutputFormat                 = 'JUnitXml'
    OutputFile                   = 'TestResults.xml'
    CodeCoverage                 = $RelevantFiles
    CodeCoverageOutputFileFormat = 'JaCoCo'
    CodeCoverageOutputFile       = 'CoverageResults.xml'
    PassThru                     = $true
}

$PesterResult = Invoke-Pester @PesterSplat
if ($PesterResult.FailedCount -gt 0) {
    throw "There were $($PesterResult.FailedCount) failed tests."
}
