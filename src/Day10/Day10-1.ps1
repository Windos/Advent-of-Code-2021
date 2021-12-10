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
    ')' = 3
    ']' = 57
    '}' = 1197
    '>' = 25137
}


$Stack = [System.Collections.Stack]::new()
$Score = 0

foreach ($Line in $Subsystem) {
    $Stack.Clear()
    foreach ($Char in $Line.ToCharArray()) {
        if ($Char -in $Pairs.Keys) {
            $Stack.Push($Char)
        } else {
            if ($Char -ne $Pairs["$($Stack.Pop())"]) {
                $Score += $ScoreCard["$Char"]
            }
        }
    }
}

$Score
