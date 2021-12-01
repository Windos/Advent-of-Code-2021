param (
    [string[]] $Readings
)

$LastReading = $null
$Increases = 0

foreach ($Reading in $Readings) {
    if ($LastReading) {
        if ($LastReading -lt $Reading) {
            $Increases += 1
        }
    }

    $LastReading = $Reading
}

$Increases
