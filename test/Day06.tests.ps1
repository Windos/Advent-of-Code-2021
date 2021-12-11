BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day06/"
}

Describe "Day 6: Lanternfish" {
    BeforeAll {
        $LanternfishData = '3,4,3,1,2'
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day06-1.ps1') -LanternfishData $LanternfishData |
                Should -Be 5934
        }

        It "should return the correct answer given a larger dataset" {
            $RealLanternfishData = Get-Content -Path "$PSScriptRoot/data/Day06.data.txt"
            . (Join-Path -Path $DayPath -ChildPath 'Day06-1.ps1') -LanternfishData $RealLanternfishData |
                Should -Be 123584
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day06-1.ps1') -LanternfishData $LanternfishData -SimulatedDays 256 |
                Should -Be 26984457539
        }

        It "should return the correct answer given a larger dataset" {
            $RealLanternfishData = Get-Content -Path "$PSScriptRoot/data/Day06.data.txt"
            . (Join-Path -Path $DayPath -ChildPath 'Day06-1.ps1') -LanternfishData $RealLanternfishData -SimulatedDays 256 |
                Should -Be 558128091987
        }
    }
}
