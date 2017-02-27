$ErrorActionPreference = 'Stop';

$packageName    = 'etcd'
$packageVersion = '2.3.8'
$url64          = 'https://github.com/coreos/etcd/releases/download/v2.3.8/etcd-v2.3.8-windows-amd64.zip'
$checksum64     = 'a13192d40fd702ec009b87cbf3b90857a380a650d9c1d849210f773f024e971d'
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
