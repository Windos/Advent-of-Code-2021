BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day10/"
}

Describe "Day 10: Syntax Scoring" {
    BeforeAll {
        $Subsystems = @(
            '[({(<(())[]>[[{[]{<()<>>'
            '[(()[<>])]({[<{<<[]>>('
            '{([(<{}[<>[]}>{[]{[(<()>'
            '(((({<>}<{<{<>}{[]{[]{}'
            '[[<[([]))<([[{}[[()]]]'
            '[{[{({}]{}}([{[{{{}}([]'
            '{<[[]]>}<{[{[{[]{()[[[]'
            '[<(<(<(<{}))><([]([]()'
            '<{([([[(<>()){}]>(<<{{'
            '<{([{{}}[<[[[<>{}]]]>[]]'
        )
        $RealSubsystems = Get-Content -Path "$PSScriptRoot/data/Day10.data.txt"
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day10-1.ps1') -Subsystem $Subsystems |
                Should -Be 26397
        }

        It "should return the correct answer given a larger dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day10-1.ps1') -Subsystem $RealSubsystems |
                Should -Be 193275
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day10-2.ps1') -Subsystem $Subsystems |
                Should -Be 288957
        }

        It "should return the correct answer given a larger dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day10-2.ps1') -Subsystem $RealSubsystems |
                Should -Be 2429644557
        }
    }
}
