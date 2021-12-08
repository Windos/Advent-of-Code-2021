BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day08/"
}

Describe "Day 6: The Treachery of Whales" {
    BeforeAll {
        $Signals = @(
            'be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe'
            'edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc'
            'fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg'
            'fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb'
            'aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea'
            'fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb'
            'dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe'
            'bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef'
            'egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb'
            'gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce'
        )
        $RealSignals = Get-Content -Path "$PSScriptRoot/data/Day08.data.txt"
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day08-1.ps1') -Signal $Signals |
                Should -Be 26
        }

        It "should return the correct answer given a larger dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day08-1.ps1') -Signal $RealSignals |
                Should -Be 381
        }

        It "should process a larger dataset in under 2 seconds" {
            $Timer = [System.Diagnostics.Stopwatch]::StartNew()
            . (Join-Path -Path $DayPath -ChildPath 'Day08-1.ps1') -Signal $RealSignals
            $Timer.Stop()
            $Timer.Elapsed.TotalMilliseconds | Should -BeLessThan 2000
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day08-2.ps1') -Signal $Signals |
                Should -Be 61229
        }

        It "should return the correct answer given a larger dataset" {
            . (Join-Path -Path $DayPath -ChildPath 'Day08-2.ps1') -Signal $RealSignals |
                Should -Be 1023686
        }

        It "should process a larger dataset with increased days in under 5 seconds" {
            $Timer = [System.Diagnostics.Stopwatch]::StartNew()
            . (Join-Path -Path $DayPath -ChildPath 'Day08-2.ps1') -Signal $RealSignals
            $Timer.Stop()
            $Timer.Elapsed.TotalMilliseconds | Should -BeLessThan 5000
        }
    }
}
