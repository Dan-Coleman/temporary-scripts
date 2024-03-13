$link = "https://download.microsoft.com/download/8/c/a/8caaa4ff-fcd6-4b3f-8fa7-5a7c6fa6ea78/x64/DacFramework.msi"
$soft_name = 'DacFramework.msi'
$dest = "C:\Windows\temp\$soft_name"

echo "Downloading DacFramework.msi"
Invoke-WebRequest -Uri $link -OutFile $dest

echo "Installing msi silenty"

$params = @{
	"FilePath" = "$Env:SystemRoot\system32\msiexec.exe"
	"ArgumentList" = @(
	"/i"
	"$dest"
	"/qn"
	)
	"Verb" = "runas"
	"PassThru" = $true
}

$install = Start-Process @params

$install.WaitForExit()

#$job = Start-Job {[msiexec /i $dest /qn]}

#Wait-Job $job

echo "Tried installing $soft_name"

exit 0
