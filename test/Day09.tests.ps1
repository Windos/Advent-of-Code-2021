BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day09/"
}

Describe "Day 9: Smoke Basin" {
    BeforeAll {
        $Heightmap = @(
            '2199943210'
            '3987894921'
            '9856789892'
            '8767896789'
            '9899965678'
        )
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day09-1.ps1') -Heightmap $Heightmap |
                Should -Be 15
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day09-2.ps1') -Heightmap $Heightmap |
                Should -Be 1134
        }
    }
}
