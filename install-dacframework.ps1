$link = "https://download.microsoft.com/download/8/c/a/8caaa4ff-fcd6-4b3f-8fa7-5a7c6fa6ea78/x64/DacFramework.msi"
$soft_name = 'DacFramework.msi'

$find = Get-WmiObject -Class Win32_Product -Filter "Name = `'$soft_name`'"

if ($find -eq $null) {

    $tmp = "$env:TEMP\$file"
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($link, $tmp)

    msiexec /i $tmp /qn
    del $tmp
    echo "Tried installing $soft_name"

} else {
    echo "ERROR: $soft_name is already installed."
    echo $find
    exit 1
}

exit 0
