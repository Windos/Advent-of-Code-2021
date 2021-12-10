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

        It "should process a larger dataset in under 10 seconds" {
            $Timer = [System.Diagnostics.Stopwatch]::StartNew()
            . (Join-Path -Path $DayPath -ChildPath 'Day07-1.ps1') -Crabs $RealCrabs
            $Timer.Stop()
            $Timer.Elapsed.TotalMilliseconds | Should -BeLessThan 10000
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

        It "should process a larger dataset with increased days in under 10 seconds" {
            $Timer = [System.Diagnostics.Stopwatch]::StartNew()
            . (Join-Path -Path $DayPath -ChildPath 'Day07-2.ps1') -Crabs $RealCrabs
            $Timer.Stop()
            $Timer.Elapsed.TotalMilliseconds | Should -BeLessThan 10000
        }
    }
}
