param (
    [String[]] $VentLines,

    [switch] $IncludeDiagonal
)

$Points = @{}

foreach ($Line in $VentLines) {
    $null = $Line -match '^(?<x1>\d+),(?<y1>\d+) -> (?<x2>\d+),(?<y2>\d+)$'

    if (($Matches.x1 -eq $Matches.x2) -or ($Matches.y1 -eq $Matches.y2)) {
        foreach ($x in $Matches.x1..$Matches.x2) {
            foreach ($y in $Matches.y1..$Matches.y2) {
                $Points[$x] += ,$y
            }
        }
    } elseif ($IncludeDiagonal.IsPresent) {
        $xs = $Matches.x1..$Matches.x2
        $ys = $Matches.y1..$Matches.y2

        for ($i = 0; $i -lt $xs.Count; $i++) {
            $Points[$xs[$i]] += ,$ys[$i]
        }
    }
}

$NumPoints = 0

foreach ($X in $Points.Keys) {
    $NumPoints += ($Points[$X] | Group-Object | Where-Object {$_.Count -gt 1}).Name.Count
}

$NumPoints
