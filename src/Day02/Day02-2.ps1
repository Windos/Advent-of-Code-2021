param (
    [string[]] $Instructions
)

$HorizontalPos = 0
$Depth = 0
$Aim = 0

foreach ($Instruction in $Instructions) {
    if ($Instruction -match '^(?<direction>forward|down|up) (?<units>\d+)$') {
        switch ($Matches.direction) {
            'forward' {
                $HorizontalPos += [int] $Matches.units
                $Depth += $Aim * [int] $Matches.units
            }
            'down' {$Aim += [int] $Matches.units}
            'up' {$Aim -= [int] $Matches.units}
        }
    }
}

$HorizontalPos * $Depth
