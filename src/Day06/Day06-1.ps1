param (
    [string] $LanternfishData,
    [int] $SimulatedDays = 80
)

$Lanternfish = @{}

$LanternfishData.Split(',') | Group-Object | ForEach-Object {
    $Lanternfish[[int] $_.Name] = $_.Count
}

foreach ($Day in 1..$SimulatedDays) {
    $NewData = @{}

    foreach ($Cycle in $Lanternfish.Keys) {
        if ($Cycle -le 0) {
            $NewData[6] += $Lanternfish[$Cycle]
            $NewData[8] += $Lanternfish[$Cycle]
        } else {
            $NewData[$Cycle - 1] += $Lanternfish[$Cycle]
        }
    }

    $Lanternfish = $NewData.Clone()
}

($Lanternfish.Values | Measure-Object -Sum).Sum
