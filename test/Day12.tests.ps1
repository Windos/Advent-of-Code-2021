BeforeAll {
    $DayPath = "$PSScriptRoot/../src/Day12/"
}

Describe "Day 12: Passage Pathing" {
    BeforeAll {
        $ShortMap = @(
            'start-A'
            'start-b'
            'A-c'
            'A-b'
            'b-d'
            'A-end'
            'b-end'
        )
        $LongMap = @(
            'dc-end'
            'HN-start'
            'start-kj'
            'dc-start'
            'dc-HN'
            'LN-dc'
            'HN-end'
            'kj-sa'
            'kj-HN'
            'kj-dc'
        )
        $LongerMap = @(
            'fs-end'
            'he-DX'
            'fs-he'
            'start-DX'
            'pj-DX'
            'end-zg'
            'zg-sl'
            'zg-pj'
            'pj-he'
            'RW-he'
            'fs-DX'
            'pj-RW'
            'zg-RW'
            'start-pj'
            'he-WI'
            'zg-he'
            'pj-fs'
            'start-RW'
        )
        $RealMap = @(
            'fw-ll'
            'end-dy'
            'tx-fw'
            'tx-tr'
            'dy-jb'
            'ZD-dy'
            'dy-BL'
            'dy-tr'
            'dy-KX'
            'KX-start'
            'KX-tx'
            'fw-ZD'
            'tr-end'
            'fw-jb'
            'fw-yi'
            'ZD-nr'
            'start-fw'
            'tx-ll'
            'll-jb'
            'yi-jb'
            'yi-ll'
            'yi-start'
            'ZD-end'
            'ZD-jb'
            'tx-ZD'
        )
    }
    Context "Part 1" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-1.ps1') -Map $ShortMap |
                Should -Be 10
        }

        It "should return the correct answer given long example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-1.ps1') -Map $LongMap |
                Should -Be 19
        }

        It "should return the correct answer given longer example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-1.ps1') -Map $LongerMap |
                Should -Be 226
        }

        It "should return the correct answer given real data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-1.ps1') -Map $RealMap |
                Should -Be 4573
        }
    }
    Context "Part 2" {
        It "should return the correct answer given example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-2.ps1') -Map $ShortMap |
                Should -Be 36
        }

        It "should return the correct answer given long example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-2.ps1') -Map $LongMap |
                Should -Be 103
        }

        It "should return the correct answer given longer example data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-2.ps1') -Map $LongerMap |
                Should -Be 3509
        }

        It "should return the correct answer given real data" {
            . (Join-Path -Path $DayPath -ChildPath 'Day12-2.ps1') -Map $RealMap |
                Should -Be 117509
        }
    }
}
