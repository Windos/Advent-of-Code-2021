BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day07/"
}

Describe "Day 7: The Treachery of Whales" {
    BeforeAll {
        $Crabs = '16,1,2,0,4,2,7,1,2,14'.Split(',')
        $RealCrabs = (Get-Content -Path "$PSScriptRoot/data/Day07.data.txt").Split(',')
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day07-1.ps1') -Crabs $Crabs |
                Should -Be 37
        }

        It "should return the correct answer given a larger dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day07-1.ps1') -Crabs $RealCrabs |
                Should -Be 329389
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day07-2.ps1') -Crabs $Crabs |
                Should -Be 168
        }

        It "should return the correct answer given a larger dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day07-2.ps1') -Crabs $RealCrabs |
                Should -Be 86397080
        }
    }
}
