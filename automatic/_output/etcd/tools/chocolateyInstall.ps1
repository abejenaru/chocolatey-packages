$ErrorActionPreference = 'Stop';

$packageName    = 'etcd'
$packageVersion = '3.1.1'
$url64          = 'https://github.com/coreos/etcd/releases/download/v3.1.1/etcd-v3.1.1-windows-amd64.zip'
$checksum64     = 'a585b31367d57390fefd0e6cb6d50b14e3716efd3d30689f5061ff9a779f00a5'
$checksumType64 = 'sha256'

$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installDir     = "C:\ProgramData\etcd"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$installDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# check OS bitness
if (!([Environment]::Is64BitOperatingSystem)) {
	Write-Error "etcd requires 64bit operating system"
	exit
}

Copy-Item "C:\ProgramData\etcd\etcd-v$packageVersion-windows-amd64\*" C:\ProgramData\etcd -Recurse -Force
Remove-Item "C:\ProgramData\etcd\etcd-v$packageVersion-windows-amd64" -Recurse -Force

# older versions of etcd didn't put EXE on the binary
if (Test-Path C:\ProgramData\etcd\etcd) {
    copy-item C:\ProgramData\etcd\etcd C:\ProgramData\etcd\etcd.exe -force
    remove-item C:\ProgramData\etcd\etcd
}
if (Test-Path C:\ProgramData\etcd\etcdctl) {
    copy-item C:\ProgramData\etcd\etcdctl C:\ProgramData\etcd\etcdctl.exe -force
    remove-item C:\ProgramData\etcd\etcdctl
}

Copy-Item C:\ProgramData\etcd\etcdctl.exe $toolsDir -Force
&nssm install etcd C:\ProgramData\etcd\etcd.exe "$($env:chocolateyPackageParameters)"
&nssm set etcd Start SERVICE_AUTO_START