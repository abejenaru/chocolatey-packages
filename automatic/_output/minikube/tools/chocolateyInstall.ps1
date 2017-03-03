$packageName    = 'minikube'
$url64          = 'https://storage.googleapis.com/minikube/releases/v0.17.1/minikube-windows-amd64.exe'
$checksum64     = '86a713ced29399c736d14bf19be7aead96a22b03374441d99a457a4c44df9d53'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\minikube.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
