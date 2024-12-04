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

Multiply-DigitsInString("mul(527,755)")