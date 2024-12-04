function Multiply-MemoryInput {
    param(
        [string]$inputString
    )

    # Remove the "mul" part and the parentheses
    $cleanedString = $inputString -replace 'mul\(|\)', ''

    # Split the numbers by comma
    $numbers = $cleanedString.Split(',')

    # Initialize a result variable
    $result = [int]$numbers[0] * [int]$numbers[1]


    return $result
}

$total = 0

$Source = get-content "E:\PowerShell\AdventOfCode\2024\Day 3 Mull It Over\Mull It Over Input.txt"

$Source[0] -match ('mul') + '\(' + '\d+' + ',' + '\d+' + '\)'

$mulArray = @()

$Pattern = ('mul') + '\(' + '\d+' + ',' + '\d+' + '\)'

for($i = 0; $i -lt $Source.Count; $i++)
{

    $mulArray += Select-String -InputObject $Source[$i] -Pattern $Pattern -AllMatches | ForEach-Object {
        $_.Matches | ForEach-Object {
            $_.Value
        }
    }

}

for($i = 0; $i -lt $mulArray.Length; $i++)
{
    $total += Multiply-MemoryInput($mulArray[$i])
    
}

$total
