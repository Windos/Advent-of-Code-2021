param (
    $Heightmap
)

$LowPoints = @()

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
            $LowPoints += [PSCustomObject] @{Row = $Row; Column = $Column}
        }
    }
}

$Global:Seen = @()

function MapBasin {
    param (
        $Row,
        $Column
    )

    # If outside the map, there's nothing to do
    if ($Row -lt 0 -or
        $Row -gt ($Heightmap.Length - 1) -or
        $Column -lt 0 -or
        $Column -gt ($Heightmap[0].Length - 1)) {
        return
    }

    # If we've already seen this point, there's nothing to do
    if ($null -eq ($Global:Seen | Where-Object {$_.Row -eq $Row -and $_.Column -eq $Column})) {
        # Height nine cannot be in a masin
        if ($Heightmap[$Row][$Column] -ne '9') {
            $Global:BasinSize += 1
            $Global:Seen += [PSCustomObject] @{Row = $Row; Column = $Column}

            # Evaluate adjacent map points
            MapBasin -Row ($Row + 1) -Column $Column
            MapBasin -Row ($Row - 1) -Column $Column
            MapBasin -Row $Row -Column ($Column + 1)
            MapBasin -Row $Row -Column ($Column - 1)
        }
    } else {
        return
    }
}

$Basins = @()

$CurrentBasin = 1

foreach ($LowPoint in $LowPoints) {
    # The process is slow, uncomment this to see the progress
    # Write-Warning $CurrentBasin
    $Global:BasinSize = 0
    MapBasin -Row $LowPoint.Row -Column $LowPoint.Column
    $Basins += ,$BasinSize
    $CurrentBasin += 1
}

$Basins = $Basins | Sort-Object
$Basins[-3] * $Basins[-2] * $Basins[-1]
