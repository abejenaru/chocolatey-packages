$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Remove-Item C:\ProgramData\etcd -Recurse -Force
Remove-Item "$toolsDir\etcdctl.exe"
