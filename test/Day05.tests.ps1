BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day05/"
}

Describe "Day 5: Hydrothermal Venture" {
    BeforeAll {
        $Vents = @(
            '0,9 -> 5,9'
            '8,0 -> 0,8'
            '9,4 -> 3,4'
            '2,2 -> 2,1'
            '7,0 -> 7,4'
            '6,4 -> 2,0'
            '0,9 -> 2,9'
            '3,4 -> 1,4'
            '0,0 -> 8,8'
            '5,5 -> 8,2'
        )
    }
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day05-1.ps1') -VentLines $Vents |
                Should -Be 5
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day05-1.ps1') -VentLines $Vents -IncludeDiagonal |
                Should -Be 12
        }
    }
}
