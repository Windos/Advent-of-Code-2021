param (
    [string[]] $Readings,

    [int] $Window = 3
)

$IndexSlide = $Window - 1

$LastSum = $null
$Increases = 0

for ($Index = 0; $Index -lt ($Readings.Count - $IndexSlide); $Index++) {
    $CurrentSum = ($Readings[$Index..($Index + $IndexSlide)] | Measure-Object -Sum).Sum
    if ($LastSum) {
        if ($LastSum -lt $CurrentSum) {
            $Increases += 1
        }
    }
    $LastSum = $CurrentSum
}

$Increases
