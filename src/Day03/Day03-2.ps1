param (
    [string[]] $Diagnostic
)

$Oxygen = $Diagnostic.Clone()
$CarbonDioxide = $Diagnostic.Clone()

function Get-BitCount {
    param (
        [string[]] $Values,
        [int] $MaxSearch
    )

    $Ones = @{}

    foreach ($Value in $Values) {
        $i = 0
        foreach ($Bit in $Value.ToCharArray()) {
            if ($i -lt $MaxSearch) {
                if ($Bit -eq '1') {
                    $Ones[$i]++
                }
                $i++
            } else {
                break
            }
        }
    }

    $Ones
}

for ($x = 1; $x -lt $Diagnostic.Count; $x++) {
    if ($Oxygen.Count -gt 1) {
        $OxygenOnes = Get-BitCount -Values $Oxygen -MaxSearch $x
        if ($OxygenOnes[$x-1] -ge ($Oxygen.Count / 2)) {
            $TempOxygen = $Oxygen | Where-Object {$_.ToCharArray()[$x-1] -eq '1'}
        } else {
            $TempOxygen = $Oxygen | Where-Object {$_.ToCharArray()[$x-1] -eq '0'}
        }

        $Oxygen = $TempOxygen
    }

    if ($CarbonDioxide.Count -gt 1) {
        $CarbonDioxideOnes = Get-BitCount -Values $CarbonDioxide -MaxSearch $x
        if ($CarbonDioxideOnes[$x-1] -ge ($CarbonDioxide.Count / 2)) {
            $TempCarbonDioxide = $CarbonDioxide | Where-Object {$_.ToCharArray()[$x-1] -eq '0'}
        } else {
            $TempCarbonDioxide = $CarbonDioxide | Where-Object {$_.ToCharArray()[$x-1] -eq '1'}
        }

        $CarbonDioxide = $TempCarbonDioxide
    }
}


$LifeSupport = [System.Convert]::ToInt32($Oxygen, 2)  * [System.Convert]::ToInt32($CarbonDioxide, 2)

$LifeSupport
