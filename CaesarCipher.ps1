function DeCipher
{
    param ([int]$shiftCount)
    $data = Get-Content ($PSScriptRoot + "\" + "input.txt")
    $output = ""
    $output += "=================ORIGIN================="
    $output += "`n"
    $output += "`n"
    for($i  = 0; $i -le $shiftCount; $i++)
    {
        foreach($line in $data)
        {
            foreach($letter in $line.ToCharArray())
            {
                if($letter -match "[a-zA-Z]")
                {
                    if(([int]$letter -ge 65 -and [int]$letter -le 90 -and ([int]$letter + $i) -ge 91 ) -or ([int]$letter -ge 97 -and [int]$letter -le 122 -and ([int]$letter + $i) -ge -123))
                    {
                        if($letter -match "[a-z]")
                        {
                            $overFlow = ($i + [int]$letter - 122)
                            $output += [char](97 + $overFlow -1)
                        }
                        else
                        {
                            $overFlow = ($i + [int]$letter - 90)
                            $output += [char](65 + $overFlow -1)
                        }
                    }
                    else
                    {
                        $output += [char]($i + [int]$letter)
                    }
                }
                else
                {
                    $output += $letter
                }
            }
            $output += "`n"
        }
        if($i -lt $shiftCount)
        {
            $output += "`n"
            $output += "=================SHIFT "  + ($i + 1) + "================="
            $output += "`n"
            $output += "`n"
        }
    }
    Set-Content -Path ($PSScriptRoot + "\" + "output.txt") -Value $output   
}