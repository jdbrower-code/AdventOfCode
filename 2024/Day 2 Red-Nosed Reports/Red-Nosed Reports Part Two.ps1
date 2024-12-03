
function Is-ContinuouslyIncreasing 
{
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

function Is-ContinuouslyDecreasing 
{
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

function No-GreaterThanThree-Increase
{
    param(
        [int[]]$arr
    )

    for($i = 0; $i -lt $arr.Length -1; $i++)
    {
        if(($arr[$i+1] - $arr[$i]) -gt 3)
        {
            return $false
        } 
    }
    return $true
}

function No-GreaterThanThree-Decrease
{
    param(
        [int[]]$arr
    )

    for($i = 0; $i -lt $arr.Length -1; $i++)
    {
        if(($arr[$i] - $arr[$i+1]) -gt 3)
        {
            return $false
        } 
    }
    return $true
}

function Matching 
{
    param(
        [int[]]$arr
    )

    for ($i = 0; $i -lt $arr.Length; $i++) {
        for ($j = $i + 1; $j -lt $arr.Length; $j++) {
            if ($arr[$i] -eq $arr[$j]) {
                Write-Output "Match found: $($arr[$i]) and $($arr[$j]) at $i"
                return $false
            }
        }
    return $true
    }
}

function OneOff-Decreasing
{
    param(
        [int[]]$arr
    )
    for ($i = 0; $i -lt $arr.Length; $i++) 
    {
        $newArr = $arr[0..($i-1)] + $arr[($i+1)..($arr.Length)]
        if(Matching($newArr))
        {
            if(Is-ContinuouslyDecreasing($newArr))
            {
                if(No-GreaterThanThree-Decrease($newArr))
                {
                    return $true
                }
            }
        }
    }
    return $false
}

function OneOff-Increasing
{
    param(
        [int[]]$arr
    )
        for ($i = 0; $i -lt $arr.Length; $i++) {
        $newArr = $arr[0..($i-1)] + $arr[($i+1)..($arr.Length)]
        if(Matching($newArr))
        {
            if(Is-ContinuouslyIncreasing($newArr))
            {
                if(No-GreaterThanThree-Increase($newArr))
                {
                    return $true
                }
                
            }
        }
    }
    return $false
}

$Source = get-content "F:\souce\AdventOfCode\2024\Day 2 Red-Nosed Reports\Red-Nosed Reports Input.txt"





$Safe = 0;

$isContinous = $false

for($i = 0; $i -lt 1000; $i++)
{
    $Temp = @()
    $Increasing = @()
    $Decreasing = @()
    for($j = 0; $j -lt $Source[$i].Split(" ").Count; $j++)
    {
        $Temp += [int]$Source[$i].Split(" ")[$j]
    }
    
    

    if(Matching($Temp))
    {
        if(Is-ContinuouslyIncreasing($Temp))
        {
                if(No-GreaterThanThree-Increase($temp))
                {
                     
                     $Safe++
                }
     
                               
        }
        elseif(Is-ContinuouslyDecreasing($Temp))
        {
            if(No-GreaterThanThree-Decrease($Temp))
            {
                    $Safe++     
            }
        }
     
     }
     elseif(OneOff-Increasing($temp))
     {
        $Safe++
     }
     elseif(OneOff-Decreasing($Temp))
     {
        $Safe++
     }
 }   


$Safe