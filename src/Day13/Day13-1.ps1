param (
    [string[]] $Instruction,
    [switch] $StopOnFirst
)

$Points = @()
$Folds = @()

foreach ($Line in $Instruction) {
    if ($Line -match '^(\d+),(\d+)$') {
        $Points += [PSCustomObject] @{
            X = [Convert]::ToInt32($Matches.1, 10)
            Y = [Convert]::ToInt32($Matches.2, 10)
        }
    } elseif ($Line -match '^fold along (\w)=(\d+)$') {
        $Folds += [PSCustomObject] @{
            Axis = $Matches.1
            Line = [Convert]::ToInt32($Matches.2, 10)
        }
    }
}

foreach ($Fold in $Folds) {
    if ($Fold.Axis -eq 'x') {
        $LeftOfFold = $Points.Where({$_.X -lt $Fold.Line})

        foreach ($Point in ($Points.Where({$_.X -gt $Fold.Line}))) {
            $NewX = $Fold.Line - ($Point.X - $Fold.Line)

            if ($Points.Where({$_.X -eq $NewX -and $_.Y -eq $Point.Y}).Count -eq 0) {
                $LeftOfFold += [PSCustomObject] @{
                    X = $NewX
                    Y = $Point.Y
                }
            }
        }

        $Points = $LeftOfFold.Clone()
    } else {
        $AboveTheFold = $Points.Where({$_.Y -lt $Fold.Line})

        foreach ($Point in ($Points.Where({$_.Y -gt $Fold.Line}))) {
            $NewY = $Fold.Line - ($Point.Y - $Fold.Line)

            if ($Points.Where({$_.X -eq $Point.X -and $_.Y -eq $NewY}).Count -eq 0) {
                $AboveTheFold += [PSCustomObject] @{
                    X = $Point.X
                    Y = $NewY
                }
            }
        }

        $Points = $AboveTheFold.Clone()
    }

    if ($StopOnFirst.IsPresent) {
        $Points.Count
        break
    }
}

if (-not $StopOnFirst.IsPresent) {
    $MaxX = ($Points.X | Measure-Object -Maximum).Maximum
    $MaxY = ($Points.Y | Measure-Object -Maximum).Maximum

    $Code = @()

    foreach ($Y in 0..$MaxY) {
        $Line = ''
        foreach ($X in 0..$MaxX) {
            if ($Points.Where({$_.X -eq $X -and $_.Y -eq $Y}).Count -eq 0) {
                $Line += '.'
            } else {
                $Line += '#'
            }
        }
        $Code += ,$Line
    }

    $Code
}
