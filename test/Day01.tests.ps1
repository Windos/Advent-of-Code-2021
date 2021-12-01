BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day01/"
}

Describe "Day 1: Sonar Sweep" {
    BeforeAll {
        $Readings = @(
            199
            200
            208
            210
            200
            207
            240
            269
            260
            263
        )
    }
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day01-1.ps1') -Readings $Readings |
                Should -Be 7
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day01-2.ps1') -Readings $Readings |
                Should -Be 5
        }
    }
}
