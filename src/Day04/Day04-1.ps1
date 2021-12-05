param (
    [string[]] $BingoInput
)

[int[]] $GeneratedNumbers = $BingoInput[0].Split(',')

$Boards = @()

$CurrentBoard = @{}
$i = 0

foreach ($Line in $BingoInput[2..($BingoInput.Length - 1)]) {
    if ($Line -match '\s*(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)') {
        $CurrentBoard[$i] = @([int] $Matches.1, [int] $Matches.2, [int] $Matches.3, [int] $Matches.4, [int] $Matches.5)
        $i++
    } else {
        $Boards += @(,$CurrentBoard)
        $CurrentBoard = @{}
        $i = 0
    }
}

if ($null -ne $CurrentBoard[0]) {
    $Boards += @(,$CurrentBoard)
}

:BingoLoop foreach ($Number in $GeneratedNumbers) {
    # Marked the called number
    foreach ($Board in $Boards) {
        foreach ($Row in 0..4) {
            foreach ($Col in 0..4) {
                if ($Board[$Row][$Col] -eq $Number) {
                    $Board[$Row][$Col] = $null
                }
            }
        }
    }

    # Check rows
    foreach ($Board in $Boards) {
        foreach ($Row in 0..4) {
            $MarkedCount = 0
            foreach ($Col in 0..4) {
                if ($null -eq $Board[$Row][$Col]) {
                    $MarkedCount++
                }
            }
            if ($MarkedCount -eq 5) {
                break BingoLoop
            }
        }
    }

    # Check columns
    foreach ($Board in $Boards) {
        foreach ($Col in 0..4) {
            $MarkedCount = 0
            foreach ($Row in 0..4) {
                if ($null -eq $Board[$Row][$Col]) {
                    $MarkedCount++
                }
            }
            if ($MarkedCount -eq 5) {
                break BingoLoop
            }
        }
    }
}

$Unmarked = 0

foreach ($Row in 0..4) {
    foreach ($Column in $Board[$Row]) {
        if ($null -ne $Column) {
            $Unmarked += $Column
        }
    }
}

$Unmarked * $Number
