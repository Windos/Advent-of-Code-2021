BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day13/"
}

Describe "Day 13: Transparent Origami" {
    BeforeAll {
        $Instructions = @(
            '6,10'
            '0,14'
            '9,10'
            '0,3'
            '10,4'
            '4,11'
            '6,0'
            '6,12'
            '4,1'
            '0,13'
            '10,12'
            '3,4'
            '3,0'
            '8,4'
            '1,10'
            '2,14'
            '8,10'
            '9,0'
            ''
            'fold along y=7'
            'fold along x=5'
        )
        $RealInstructions = Get-Content -Path "$PSScriptRoot/data/Day13.data.txt"
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day13-1.ps1') -StopOnFirst -Instruction $Instructions |
                Should -Be 17
        }

        It "should return the correct answer given real data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day13-1.ps1') -StopOnFirst -Instruction $RealInstructions |
                Should -Be 704
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            $Code = . (Join-Path -Path $DayPath -ChildPath 'Day13-1.ps1') -Instruction $Instructions
            $Code[0] | Should -Be '#####'
            $Code[1] | Should -Be '#...#'
            $Code[2] | Should -Be '#...#'
            $Code[3] | Should -Be '#...#'
            $Code[4] | Should -Be '#####'
        }

        It "should return the correct answer given real data" {
            $Code = . (Join-Path -Path $DayPath -ChildPath 'Day13-1.ps1') -Instruction $RealInstructions
            $Code[0] | Should -Be '#..#..##...##....##.###..####.#..#..##.'
            $Code[1] | Should -Be '#..#.#..#.#..#....#.#..#.#....#..#.#..#'
            $Code[2] | Should -Be '####.#....#..#....#.###..###..####.#...'
            $Code[3] | Should -Be '#..#.#.##.####....#.#..#.#....#..#.#...'
            $Code[4] | Should -Be '#..#.#..#.#..#.#..#.#..#.#....#..#.#..#'
            $Code[5] | Should -Be '#..#..###.#..#..##..###..####.#..#..##.'
        }
    }
}
