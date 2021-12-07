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
        $FuelCost += [math]::Abs($Crab - $Position)
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
