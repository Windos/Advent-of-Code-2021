param (
    $Map
)

$Routes = @{}

foreach ($Route in $Map) {
    if ($Route -match '^(\w+)-(\w+)$') {
        $Routes[$Matches.1] += ,$Matches.2
        $Routes[$Matches.2] += ,$Matches.1
    }
}

$Global:RouteCount = 0

function WalkMap {
    param (
        [string[]] $PartialRoute
    )

    foreach ($NextStep in $Routes["$($PartialRoute[-1])"]) {
        if ($NextStep -eq 'end') {
            $Global:RouteCount++
            continue
        }

        if (
               $NextStep -ne 'start' -and
               ($NextStep -notin $PartialRoute -or
               ($NextStep -cmatch '^[A-Z]+$') -or
               ($PartialRoute.Where({$_ -cmatch '^[a-z]+$' -and $_ -ne 'start'}) |
                   Group-Object |
                   Where-Object {$_.Count -gt 1}).Count -lt 1)
           ) {
            $ExpandedRoute = $PartialRoute.Clone()
            $ExpandedRoute += $NextStep
            WalkMap -PartialRoute $ExpandedRoute
        }
    }
}

WalkMap @('start')

$Global:RouteCount
