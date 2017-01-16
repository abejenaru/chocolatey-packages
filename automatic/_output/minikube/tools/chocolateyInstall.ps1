$packageName    = 'minikube'
$packageVersion = '0.15.0'
$url64          = 'https://storage.googleapis.com/minikube/releases/v0.15.0/minikube-windows-amd64.exe'
$checksum64     = '11b6499c3b8079a7b7c74482c119db244d2585332a649de1edd0cc9bc85ce1b9'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\$packageName.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"
