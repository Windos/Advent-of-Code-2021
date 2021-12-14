param (
    [string[]] $PolymerTemplate,
    [int] $Step = 10
)

$Polymer = $PolymerTemplate[0]
$Insertions = @{}

foreach ($Line in $PolymerTemplate[2..($PolymerTemplate.Length - 1)]) {
    if ($Line -match '^(\w{2}) -> (\w)$') {
        $Insertions[$Matches.1] = $Matches.2
    }
}

$Pairs = @{}
$CharCounts = @{}
foreach ($Char in $Polymer.ToCharArray()) {
    $CharCounts[$Char] += 1
}


foreach ($Index in 0..($Polymer.Length - 2)) {
    $Pairs[$Polymer[$Index] + $Polymer[$Index + 1]] += 1
}

foreach ($Step in 1..$Step) {
    $NewPairs = @{}

    foreach ($Pair in $Pairs.Keys) {
        $First = $Pair[0]
        $Second = $Pair[1]
        $Count = $Pairs[$Pair]
        $Insertion = $Insertions[$Pair]

        $NewPairs[$First + $Insertion] += $Count
        $NewPairs[$Insertion + $Second] += $Count
        $CharCounts[[char] $Insertion] += $Count
    }

    $Pairs = $NewPairs.Clone()
}

$FinalCount = @()
foreach ($CharCount in $CharCounts.Keys) {
    $FinalCount += [PSCustomObject] @{
        Char = $CharCount
        Num  = $CharCounts[$CharCount]
    }
}

$Sorted = $FinalCount | Sort-Object -Property Num

$Sorted[-1].Num - $Sorted[0].Num
