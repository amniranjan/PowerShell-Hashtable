<#create two hashtables

$Common = @{}
$Diff = @{}

$Common["Adobe"] = "23.2"
$Common["Citrix"] = "22.0"
$Common["postman"] = "1.0"

$Diff["Adobe"] = "23.2"
$Diff["Citrix"] = "22.0"
$Diff["hardhik"] = "1.0"


$Identical = @{}
$Nonidentical = @{}

foreach ($key in $Common.Keys)
{
foreach ($val in $Diff.Values)
{
if($Diff.ContainsKey($key) -and $Common[$key] -eq $Diff[$key] -and $Common[$val] -eq $Diff[$val]) 
{
$Identical[$key] = $Common[$key]


}
else
{

$Nonidentical[$key] = $Common[$key]

}
}
}


write-output "The same app are : " $Identical
write-output "The Diff app are : " $Nonidentical
#>


# Create two hashtables
$Common = @{
    "Adobe" = "23.2"
    "Citrix" = "22.0"
    "postman" = "1.0"
}

$Diff = @{
    "Adobe" = "23.1"
    "Citrix" = "22.0"
    "hardhik" = "1.0"
}

# Initialize result hashtables
$Identical = @{}
$Nonidentical = @{}

try {
    # Compare the two hashtables
    foreach ($key in $Common.Keys) {
        if ($Diff.ContainsKey($key)) {
            if ($Common[$key] -eq $Diff[$key] -and $Common[$key] -eq $Diff[$key]) {
                $Identical[$key] = $Common[$key]
            } else {
                $Nonidentical[$key] = $Common[$key]
            }
        } else {
            # Handle cases where the key exists in $Common but not in $Diff
            $Nonidentical[$key] = $Common[$key]
        }
    }

    foreach ($key in $Diff.Keys) {
        if (!$Common.ContainsKey($key)) {
            # Handle cases where the key exists in $Diff but not in $Common
            $Nonidentical[$key] = $Diff[$key]
        }
    }

    Write-Output "Identical items are: "
    $Identical
    Write-Output "Non-identical items are: "
    $Nonidentical
}
catch {
    Write-Error "An error occurred: $_"
    # Exit the script or take appropriate action here
}


