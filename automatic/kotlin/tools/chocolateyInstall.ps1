$ErrorActionPreference = 'Stop';

$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$url            = '{{DownloadUrl}}'
$checksum       = '{{Checksum}}'
$checksumType   = 'sha256'

$toolsDir       = Get-ToolsLocation
$kotlin_home    = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"

Install-ChocolateyEnvironmentVariable -VariableName 'KOTLIN_HOME' -VariableValue "$kotlin_home" -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "%KOTLIN_HOME%\bin" -PathType 'Machine'
