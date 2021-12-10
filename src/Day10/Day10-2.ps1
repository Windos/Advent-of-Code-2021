param (
    $Subsystem
)

$Pairs = @{
    '(' = ')'
    '[' = ']'
    '{' = '}'
    '<' = '>'
}

$ScoreCard = @{
    ')' = 1
    ']' = 2
    '}' = 3
    '>' = 4
}


$Stack = [System.Collections.Stack]::new()
$Scores = @()

foreach ($Line in $Subsystem) {
    $Stack.Clear()
    $Corrupted = $false
    foreach ($Char in $Line.ToCharArray()) {
        if ($Char -in $Pairs.Keys) {
            $Stack.Push($Char)
        } else {
            if ($Char -ne $Pairs["$($Stack.Pop())"]) {
                $Corrupted = $true
                break
            }
        }
    }

    if (-not $Corrupted) {
        $Score = 0

        while ($Stack.Count -gt 0) {
            $Score = $Score * 5
            $Score += $ScoreCard[$Pairs["$($Stack.Pop())"]]
        }

        $Scores += ,$Score
    }
}

($Scores | Sort-Object)[$Scores.Count / 2]
