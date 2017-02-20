$packageName    = 'minikube'
$url64          = 'https://storage.googleapis.com/minikube/releases/v0.16.0/minikube-windows-amd64.exe'
$checksum64     = 'e3f21e866fc2b241c69b0836ebf9ac2d4a7eae3a234aa5c1b1447073e3e0804a'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\minikube.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
