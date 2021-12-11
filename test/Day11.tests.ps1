BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day11/"
}

Describe "Day 11: Dumbo Octopus" {
    BeforeAll {
        $EnergyReadings = @(
            '5483143223'
            '2745854711'
            '5264556173'
            '6141336146'
            '6357385478'
            '4167524645'
            '2176841721'
            '6882881134'
            '4846848554'
            '5283751526'
        )
        $RealEnergyReadings = @(
            '4438624262'
            '6263251864'
            '2618812434'
            '2134264565'
            '1815131247'
            '2612457325'
            '8585767584'
            '7217134556'
            '2825456563'
            '8248473584'
        )
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day11-1.ps1') -EnergyReading $EnergyReadings |
                Should -Be 1656
        }

        It "should return the correct answer given a puzzle dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day11-1.ps1') -EnergyReading $RealEnergyReadings |
                Should -Be 1640
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day11-2.ps1') -EnergyReading $EnergyReadings |
                Should -Be 195
        }

        It "should return the correct answer given a puzzle dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day11-2.ps1') -EnergyReading $RealEnergyReadings |
                Should -Be 312
        }
    }
}
