
function Is-ContinuouslyIncreasing {
    param (
        [int[]]$arr
    )

    for ($i = 0; $i -lt $arr.Length - 1; $i++) {
        if ($arr[$i] -ge $arr[$i + 1]) {
            return $false 
        }
    }
    return $true
}

function Is-ContinuouslyDecreasing {
    param (
        [int[]]$arr
    )

    for ($i = 0; $i -lt $arr.Length - 1; $i++) {
        if ($arr[$i] -lt $arr[$i + 1]) {
            return $false 
        }
    }
    return $true
}


$Source = get-content "E:\PowerShell\AdventOfCode\2024\Day 2 Red-Nosed Reports\Red-Nosed Reports Input.txt"



$Increasing = @()
$Decreasing = @()

$Safe = 0;

$isContinous = $false

for($i = 2; $i -lt 3; $i++)
{
    $Temp = @()
    for($j = 0; $j -lt $Source[$i].Split(" ").Count; $j++)
    {
        $Temp += $Source[$i].Split(" ")[$j]
    }
    if(Is-ContinuouslyIncreasing($Temp))
    {
        for($k = 0; $k -lt ($Temp.Count - 1); $k++)
        {
            $math =  ([int]$temp[$k+1] - [int]$temp[$k])
            $math
        }
                   
    }
}