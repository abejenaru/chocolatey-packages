$packageName    = 'kubernetes-kompose'
$url64          = 'https://github.com/kubernetes-incubator/kompose/releases/download/v0.5.0/kompose-windows-amd64.exe'
$checksum64     = '134c7218706066de1b496ea103cdd916731f5aaed105fff319dad77221422de3'
$checksumType64 = 'sha256'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath   = "$toolsDir\kompose.exe"


Get-ChocolateyWebFile -PackageName "$packageName" -FileFullPath "$fileFullPath" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Remove tools sub-folders (previous package installations)
$subdirs = Get-ChildItem "$toolsDir" -Directory
foreach ($subdir in $subdirs) {
    Remove-Item "$toolsDir\$subdir" -Recurse
}
