param (
    [string []] $Signal
)

$Sum = 0

foreach ($Line in $Signal) {
    if ($Line -match '\| (\w+) (\w+) (\w+) (\w+)$') {
        foreach ($Index in 1..4) {
            if ($Matches[$Index].length -in @(2,3,4,7)) {
                $Sum++
            }
        }
    }
}

$Sum
