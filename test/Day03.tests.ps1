BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day03/"
}

Describe "Day 3: Binary Diagnostic" {
    BeforeAll {
        $Diagnostic = @(
            '00100'
            '11110'
            '10110'
            '10111'
            '10101'
            '01111'
            '00111'
            '11100'
            '10000'
            '11001'
            '00010'
            '01010'
        )
    }
    Context "Part 1" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day03-1.ps1') -Diagnostic $Diagnostic |
                Should -Be 198
        }
    }
    Context "Part 2" {
        It "should return the correct answer" {
            . (Join-Path -Path $DayPath -ChildPath 'Day03-2.ps1') -Diagnostic $Diagnostic |
                Should -Be 230
        }
    }
}
