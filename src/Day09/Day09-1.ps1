param (
    $Heightmap
)

$SumOfAllRisk = 0

foreach ($Row in 0..($Heightmap.Length - 1)) {
    foreach ($Column in 0..($Heightmap[0].Length - 1)) {
        $TestNumber = [Convert]::ToInt32($Heightmap[$Row][$Column], 10)

        if ($TestNumber -ne 9) {
            # Up
            if ($Row -gt 0 -and [Convert]::ToInt32($Heightmap[$Row - 1][$Column], 10) -le $TestNumber) {
                continue
            }

            # Down
            if ($Row -lt ($Heightmap.Length - 1) -and [Convert]::ToInt32($Heightmap[$Row + 1][$Column], 10) -lt $TestNumber) {
                continue
            }

            # Left
            if ($Column -gt 0 -and [Convert]::ToInt32($Heightmap[$Row][$Column - 1], 10) -le $TestNumber) {
                continue
            }

            # Right
            if ($Column -lt ($Heightmap[0].Length - 1) -and [Convert]::ToInt32($Heightmap[$Row][$Column + 1], 10) -le $TestNumber) {
                continue
            }

            # Is low point
            $SumOfAllRisk += ($TestNumber + 1)
        }
    }
}

$SumOfAllRisk
