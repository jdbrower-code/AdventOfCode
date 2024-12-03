function Check-Report-Safety {
    param (
        [Array]$report
    )
    
    # Check if a report is safe
    function Is-Safe($levels) {
        $increasing = $true
        $decreasing = $true

        for ($i = 0; $i -lt $levels.Length - 1; $i++) {
            $diff = $levels[$i + 1] - $levels[$i]
            if ($diff -lt 1 -or $diff -gt 3) {
                return $false
            }

            if ($diff -gt 0) {
                $decreasing = $false
            } elseif ($diff -lt 0) {
                $increasing = $false
            }
        }

        # If it's either strictly increasing or strictly decreasing
        return $increasing -or $decreasing
    }

    return Is-Safe -levels $report
}

$Source = get-content "F:\souce\AdventOfCode\2024\Day 2 Red-Nosed Reports\Red-Nosed Reports Input.txt"
# Count how many reports are safe
$safeCount = 0

foreach ($line in $Source) {
    $report = $line -split " " | ForEach-Object { [int]$_ }
    if (Check-Report-Safety -report $report) {
        $safeCount++
    }
}

# Output the number of safe reports
Write-Output "Safe reports: $safeCount"
