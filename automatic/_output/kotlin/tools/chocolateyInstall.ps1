$ErrorActionPreference = 'Stop';

$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$url            = 'https://github.com/JetBrains/kotlin/releases/download/v1.1/kotlin-compiler-1.1.zip'
$checksum       = 'aa44db28bf3ccdae8842b6b92bec5991eb430a80e580aafbc6a044678a2f359d'
$checksumType   = 'sha256'

$toolsDir       = Get-ToolsLocation
$kotlin_home    = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"

# Rename unzipped folder
Rename-Item "$toolsDir\kotlinc" "$kotlin_home"

Install-ChocolateyEnvironmentVariable -VariableName 'KOTLIN_HOME' -VariableValue "$kotlin_home" -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "%KOTLIN_HOME%\bin" -PathType 'Machine'
