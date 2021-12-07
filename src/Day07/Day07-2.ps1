param (
    [int[]] $Crabs
)

$Min = ($Crabs | Measure-Object -Minimum).Minimum
$Max = ($Crabs | Measure-Object -Maximum).Maximum

$LowestFuelCost = [int32]::MaxValue
$IncreaseCount = 0

foreach ($Position in $Min..$Max) {
    $FuelCost = 0
    foreach ($Crab in $Crabs) {
        $PositionShift = [math]::Abs($Crab - $Position)
        # https://en.wikipedia.org/wiki/1_%2B_2_%2B_3_%2B_4_%2B_%E2%8B%AF
        $FuelCost += ($PositionShift * ($PositionShift + 1)) / 2
    }
    if ($FuelCost -lt $LowestFuelCost) {
        $LowestFuelCost = $FuelCost
        $IncreaseCount = 0
    } else {
        $IncreaseCount++
    }

    # Operating on an assumption that the fuel cost should get better until the best is found,
    # and then the fuel cost should start to get worse consistently.
    # If the fuel cost is getting worse consistently, then the loop can be stopped.
    # Setting this to five gives a "opps, tricked you" lower fuel cost to keep the loop going.
    if ($IncreaseCount -gt 5) {
        break
    }
}

$LowestFuelCost
