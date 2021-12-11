param (
    $EnergyReading
)

$Octopuses = @()

foreach ($Row in 0..($EnergyReading.Length - 1)) {
    foreach ($Column in 0..($EnergyReading[0].Length - 1)) {
        $Octopuses += [PSCustomObject] @{
            PosX    = $Row
            PosY    = $Column
            Flashed = $false
            Energy  = [Convert]::ToInt32($EnergyReading[$Row][$Column], 10)
        }
    }
}

$Global:Flashes = 0

function EnergyUp {
    param (
        $X,
        $Y
    )

    $Octopus = ($Octopuses.Where({$_.PosX -eq $X -and $_.PosY -eq $Y}))[0]

    if ($null -ne $Octopus) {
        if ($Octopus.Flashed -eq $false) {
            $Octopus.Energy += 1
        }

        if ($Octopus.Energy -gt 9) {
            if ($Octopus.Flashed -eq $false) {
                $Global:Flashes += 1
                $Octopus.Flashed = $true
                $Octopus.Energy = 0

                # Up Left
                EnergyUp -X ($Octopus.PosX + 1) -Y ($Octopus.PosY - 1)
                # Left
                EnergyUp -X ($Octopus.PosX) -Y ($Octopus.PosY - 1)
                # Down Left
                EnergyUp -X ($Octopus.PosX - 1) -Y ($Octopus.PosY - 1)
                # Down
                EnergyUp -X ($Octopus.PosX - 1) -Y ($Octopus.PosY)
                # Down Right
                EnergyUp -X ($Octopus.PosX - 1) -Y ($Octopus.PosY + 1)
                # Right
                EnergyUp -X ($Octopus.PosX) -Y ($Octopus.PosY + 1)
                # Up Right
                EnergyUp -X ($Octopus.PosX + 1) -Y ($Octopus.PosY + 1)
                # Up
                EnergyUp -X ($Octopus.PosX + 1) -Y ($Octopus.PosY)
            }
        }
    }
}

$Step = 0

while ($true) {
    $Step++

    foreach ($Row in 0..($EnergyReading.Length - 1)) {
        foreach ($Column in 0..($EnergyReading[0].Length - 1)) {
            EnergyUp -X $Row -Y $Column
        }
    }

    if ($Octopuses.Flashed -notcontains $false) {
        break
    }

    foreach ($Octopus in $Octopuses) {
        $Octopus.Flashed = $false
    }
}

$Step
