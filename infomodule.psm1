<#
.Synopsis
 Checking how much space is left on the C: drive and giving BIOS information
.Description
This is a module with some cmdlets on information about the computer.
It currently contains get-diskinfo and get-biosinfo
parameter ComputerName
This is for remote computers
.example
get-DiskInfo -computername remote
This is for a remote computer
.example 
get-diskinfo -DevID = d:
This will get the information about the d: drive. 
.example
Get-Biosinfo -computername remote
This is for a remote computer
.example 
You can give disk-info multiple values for the computername parameter.
disk-info -computerame hostname1,hostname2 -devID 
#>

$ModuleVersion = '1.0'

# ID used to uniquely identify this module
$GUID = '19b67af2-d5f6-4c8a-a366-09a7efa17662'

# Author of this module
$Author = 'Sigurd Skauvik'


function Get-Diskinfo {
[cmdletBinding()]
param(
    [Parameter(valueFromPipeline=$true,
                ValueFromPipelineByPropertyName=$true)]
            [alias('hostname')]
    [string[]]$computername = 'localhost',
    [string]$devID = 'c:'
)
Get-WmiObject -computername $computername -class win32_logicaldisk -filter "DeviceID='$devID'" | select PSComputername, DeviceID, VolumeName,
                    @{n='size(GB)';e={$_.size / 1gb -as [int]}},
                    @{n='free(GB)';e={$_.freespace / 1gb -as [int]}} 
}
function Get-Biosinfo {
[cmdletBinding()]
param(
    [parameter(mandatory=$true)]
    [string[]]$computername = 'localhost',
    [int]$bogus = 1
)
Get-WmiObject -computername $computername -class win32_bios  
}