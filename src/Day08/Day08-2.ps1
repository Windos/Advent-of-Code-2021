param (
    [string []] $Signal
)

$Sum = 0

foreach ($Line in $Signal) {
    $SegmentNumbers = @{
        1 = @()
        2 = @()
        3 = @()
        4 = @()
        5 = @()
        6 = @()
        7 = @()
        8 = @()
        9 = @()
        0 = @()
    }

    if ($Line -match '^(\w+) (\w+) (\w+) (\w+) (\w+) (\w+) (\w+) (\w+) (\w+) (\w+) \| (\w+) (\w+) (\w+) (\w+)$') {
        # We already know a few numbers based on their length, so let's slot those in up front
        foreach ($Index in 1..10) {
            switch ($Matches[$Index].length) {
                2 {
                    $SegmentNumbers[1] = $Matches[$Index].ToCharArray()
                }
                3 {
                    $SegmentNumbers[7] = $Matches[$Index].ToCharArray()
                }
                4 {
                    $SegmentNumbers[4] = $Matches[$Index].ToCharArray()
                }
                7 {
                    $SegmentNumbers[8] = $Matches[$Index].ToCharArray()
                }
            }
        }

        # Now we can infer these three numbers that light up six segments
        foreach ($Index in 1..10) {
            if ($Matches[$Index].length -eq 6) {
                if ((Compare-Object -ReferenceObject $Matches[$Index].ToCharArray() -DifferenceObject ($SegmentNumbers[7] + $SegmentNumbers[4] | Select-Object -Unique) | Where-Object {$_.SideIndicator -eq '<='}).InputObject.Count -eq 1){
                    # We can infer 9 by counting the unique segments compaired to 7 and 4
                    #
                    #  9          7       4          One unique segment in 9
                    #
                    #  aaaa   |   aaaa    ....   |   ....
                    # b    c  |  .    c  b    c  |  .    .
                    # b    c  |  .    c  b    c  |  .    .
                    #  dddd   |   ....    dddd   |   ....
                    # .    f  |  .    f  .    f  |  .    .
                    # .    f  |  .    f  .    f  |  .    .
                    #  gggg   |   ....    ....   |   gggg

                    $SegmentNumbers[9] = $Matches[$Index].ToCharArray()
                } elseif ((Compare-Object -ReferenceObject $SegmentNumbers[7] -DifferenceObject $Matches[$Index].ToCharArray() | Where-Object {$_.SideIndicator -eq '<='}).InputObject.Count -eq 1) {
                    # We can infer 6 by counting the unique segments compaired to 7
                    #
                    #  7          6          One unique segment in 7
                    #
                    #  aaaa   |   aaaa   |   ....
                    # .    c  |  b    .  |  .    c
                    # .    c  |  b    .  |  .    c
                    #  ....   |   dddd   |   ....
                    # .    f  |  e    f  |  .    .
                    # .    f  |  e    f  |  .    .
                    #  ....   |   gggg   |   ....

                    $SegmentNumbers[6] = $Matches[$Index].ToCharArray()
                } else {
                    # This leaves only 0
                    $SegmentNumbers[0] = $Matches[$Index].ToCharArray()
                }
            }
        }

        # We can now figure out some specific segments, which can be used to figure out the final numbers.

        #  8          9          'e' is the unique segment
        #
        #  aaaa   |   aaaa   |   ....
        # b    c  |  b    c  |  .    .
        # b    c  |  b    c  |  .    .
        #  dddd   |   dddd   |   ....
        # e    f  |  .    f  |  e    .
        # e    f  |  .    f  |  e    .
        #  gggg   |   gggg   |   ....

        $e = (Compare-Object -ReferenceObject $SegmentNumbers[8] -DifferenceObject $SegmentNumbers[9] | Where-Object {$_.SideIndicator -eq '<='}).InputObject

        #  8          6          'c' is the unique segment
        #
        #  aaaa   |   aaaa   |   ....
        # b    c  |  b    .  |  .    c
        # b    c  |  b    .  |  .    c
        #  dddd   |   dddd   |   ....
        # e    f  |  e    f  |  .    .
        # e    f  |  e    f  |  .    .
        #  gggg   |   gggg   |   ....

        $c = (Compare-Object -ReferenceObject $SegmentNumbers[8] -DifferenceObject $SegmentNumbers[6] | Where-Object {$_.SideIndicator -eq '<='}).InputObject

        #  1          'c'        Natually, 'f' is the second segment in 1 that isn't the known 'c'
        #
        #  ....   |   ....   |   ....
        # .    c  |  .    c  |  .    .
        # .    c  |  .    c  |  .    .
        #  ....   |   ....   |   ....
        # .    f  |  .    .  |  .    f
        # .    f  |  .    .  |  .    f
        #  ....   |   ....   |   ....

        $f = (Compare-Object -ReferenceObject $SegmentNumbers[1] -DifferenceObject $c | Where-Object {$_.SideIndicator -eq '<='}).InputObject

        # the final numbers are all five segments
        foreach ($Index in 1..10) {
            if ($Matches[$Index].length -eq 5) {
                if ($c -notin $Matches[$Index].ToCharArray() -and $e -notin $Matches[$Index].ToCharArray()) {
                    #  5          No 'c'  No 'e'
                    #
                    #  aaaa   |   ....    ....
                    # b    .  |  .    c  .    .
                    # b    .  |  .    c  .    .
                    #  dddd   |   ....    ....
                    # .    f  |  .    .  e    .
                    # .    f  |  .    .  e    .
                    #  gggg   |   ....    ....

                    $SegmentNumbers[5] = $Matches[$Index].ToCharArray()
                } elseif ($c -in $Matches[$Index].ToCharArray() -and $f -notin $Matches[$Index].ToCharArray()) {
                    #  2          Yes 'c' No 'f'
                    #
                    #  aaaa   |   ....    ....
                    # .    c  |  .    c  .    .
                    # .    c  |  .    c  .    .
                    #  dddd   |   ....    ....
                    # e    .  |  .    .  .    f
                    # e    .  |  .    .  .    f
                    #  gggg   |   ....    ....

                    $SegmentNumbers[2] = $Matches[$Index].ToCharArray()
                } else {
                    # The only thing left is 3
                    $SegmentNumbers[3] = $Matches[$Index].ToCharArray()
                }
            }
        }

        $DecodedNumber = @()

        foreach ($Index in 11..14) {
            $Value = $Matches[$Index].ToCharArray()
            foreach ($Number in 0..9) {
                # Matching output values (which can be in a jumbled order) to the actual number.
                # Testing length first to avoid Compare-Object until it's needed.
                if ($Value.Length -eq $SegmentNumbers[$Number].Length -and
                    (Compare-Object -ReferenceObject $Value -DifferenceObject $SegmentNumbers[$Number]).Count -eq 0) {
                    $DecodedNumber += $Number
                    break
                }
            }
        }

        # Join the char array back into a single string, cast as int, sum it up.
        $Sum += [int] ($DecodedNumber -join '')
    }
}

$Sum
