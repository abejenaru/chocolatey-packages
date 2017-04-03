$ErrorActionPreference = 'Stop';

$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$url            = 'https://github.com/JetBrains/kotlin/releases/download/v1.1.2-eap-44/kotlin-compiler-1.1.2-eap-44.zip'
$checksum       = 'c554a73760741bf809e0963831c10a8a0c719521e2459753a4d0eec3396bc515'
$checksumType   = 'sha256'

$toolsDir       = Get-ToolsLocation
$kotlin_home    = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"

# Rename unzipped folder
Rename-Item "$toolsDir\kotlinc" "$kotlin_home"

Install-ChocolateyEnvironmentVariable -VariableName 'KOTLIN_HOME' -VariableValue "$kotlin_home" -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "%KOTLIN_HOME%\bin" -PathType 'Machine'
