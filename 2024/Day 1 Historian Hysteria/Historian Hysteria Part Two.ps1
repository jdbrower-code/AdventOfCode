function BubbleSort
{
    param
    (
        [array]$array
    )
    $n = $array.count
    for ($i = 1; $i -lt $n; $i++) {
        for ($j = 0; $j -lt ($n - $i); $j++) {
            if ($array[$j] -gt $array[$j + 1]) {
                $temp = $array[$j]
                $array[$j] = $array[$j + 1]
                $array[$j + 1] = $temp
            }
        }
    }
    return $array

}


$Source = Get-Content "E:\PowerShell\AdventOfCode\2024\Day 1 Historian Hysteria\Historian Hysteria Input.txt"
#There are 3 white spaces inbetween the numbers
$LeftColumn = @()
$RightColomn = @()
$Distance = 0;



for($i = 0; $i -lt $Source.Count; $i++)
{
    $LeftColumn += $Source[$i].Split(" ")[0]
    $RightColomn += $Source[$i].Split(" ")[3]
}

$LeftColumnSorted = BubbleSort $LeftColumn
$RightColumnSorted = BubbleSort $RightColomn

[uint64]$total = 0;

for($i = 0; $i -lt $LeftColumnSorted.Count; $i++)
{
    $tempCounter = 0
    for ($j = 0; $j -lt $RightColumnSorted.count; $j++)
    {
        if($LeftColumnSorted[$i] -eq $RightColumnSorted[$j])
        {
            $tempCounter++
        }
    }
    $total += ([int]$LeftColumnSorted[$i] * $tempCounter)

}



