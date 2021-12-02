BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day02/"
}

Describe "Day 2: Dive!" {
    BeforeAll {
        $Instructions = @(
            'forward 5',
            'down 5',
            'forward 8',
            'up 3',
            'down 8',
            'forward 2'
        )
    }
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day02-1.ps1') -Instructions $Instructions |
                Should -Be 150
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day02-2.ps1') -Instructions $Instructions |
                Should -Be 900
        }
    }
}
