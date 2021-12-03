param (
    [string[]] $Diagnostic
)

$Ones = @{}

foreach ($Value in $Diagnostic) {
    $i = 0
    foreach ($Bit in $Value.ToCharArray()) {
        if ($Bit -eq '1') {
            $Ones[$i]++
        }
        $i++
    }
}

$Gamma = ''
$Epsilon = ''

foreach ($Key in ($Ones.Keys | Sort-Object)) {
    if ($Ones[$Key] -gt ($Diagnostic.Count / 2)) {
        $Gamma += '1'
        $Epsilon += '0'
    } else {
        $Gamma += '0'
        $Epsilon += '1'
    }
}

$PowerConsumption = [System.Convert]::ToInt32($Gamma, 2)  * [System.Convert]::ToInt32($Epsilon, 2)

$PowerConsumption
