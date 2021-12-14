BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day14/"
}

Describe "Day 14: Extended Polymerization" {
    BeforeAll {
        $Template = @(
            'NNCB'
            ''
            'CH -> B'
            'HH -> N'
            'CB -> H'
            'NH -> C'
            'HB -> C'
            'HC -> B'
            'HN -> C'
            'NN -> C'
            'BH -> H'
            'NC -> B'
            'NB -> B'
            'BN -> B'
            'BB -> N'
            'BC -> B'
            'CC -> N'
            'CN -> C'
        )
        $RealTemplate = Get-Content -Path "$PSScriptRoot/data/Day14.data.txt"
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day14-1.ps1') -PolymerTemplate $Template |
                Should -Be 1588
        }

        It "should return the correct answer given real data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day14-1.ps1') -PolymerTemplate $RealTemplate |
                Should -Be 3247
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day14-1.ps1') -PolymerTemplate $Template -Step 40 |
                Should -Be 2188189693529
        }

        It "should return the correct answer given real data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day14-1.ps1') -PolymerTemplate $RealTemplate -Step 40 |
                Should -Be 4110568157153
        }
    }
}
