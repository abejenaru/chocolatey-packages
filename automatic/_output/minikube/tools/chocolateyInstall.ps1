$packageName    = 'minikube'
$url64          = 'https://storage.googleapis.com/minikube/releases/v0.18.0/minikube-windows-amd64.exe'
$checksum64     = '302bfe9747882291e686ecf6f337e78836f7bb0e1783fc6d8bf1f3482fb2badf'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\minikube.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
