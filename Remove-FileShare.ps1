 Function Remove-FileShare
{
<# 
.SYNOPSIS 
    Remove-FileShare is a function which  
 
.DESCRIPTION 
    Remove-FileShare is a function which 
 
.PARAMETER ComputerName 
    Description
 
.PARAMETER FilePath 
    Description 
 
.EXAMPLE 
    Remove-FileShare -ComputerName ABCV -FilePath C:\ -Verbose 
 
.EXAMPLE 
    Remove-FileShare -ComputerName ABCV -Verbose
 
.EXAMPLE 
    Remove-FileShare -Verbose
 
.INPUTS 
    String 
 
.OUTPUTS 
    None 
 
.NOTES 
    Author:  Derek Luk 
    Website: http://ottawa.ca
    Twitter: @dduckluk

    Version 0: 02/08/2018 13:30:15
 
#>

    [CmdletBinding()]
    Param(
    [Parameter(Mandatory=$true)]
    $ComputerName,
    [Parameter(Mandatory=$true)]
    [ValidateScript({If (Get-WMIObject -ComputerName $ComputerName Win32_Share -filter "Name = $_")
    {$true} else {Throw "$_ is not a valid Share on $ComputerName"}})]
    $ShareName
    )

    Begin{}

    Process{
        #Code
        ([wmi]"\\$ComputerName\root\cimv2:Win32_Share='$ShareName'").Delete()
    }

    End {}
}
 
