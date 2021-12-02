param (
    [string[]] $Instructions
)

$HorizontalPos = 0
$Depth = 0

foreach ($Instruction in $Instructions) {
    if ($Instruction -match '^(?<direction>forward|down|up) (?<units>\d+)$') {
        switch ($Matches.direction) {
            'forward' {$HorizontalPos += [int] $Matches.units}
            'down' {$Depth += [int] $Matches.units}
            'up' {$Depth -= [int] $Matches.units}
        }
    }
}

$HorizontalPos * $Depth
