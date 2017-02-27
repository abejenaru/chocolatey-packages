$ErrorActionPreference = 'Stop';

$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$url            = 'https://github.com/JetBrains/kotlin/releases/download/v1.0.6/kotlin-compiler-1.0.6.zip'
$checksum       = '42a20b72d1e90f9efa9d13aab97559f478cc32b7c2e6da8569cdc3741a8e14b6'
$checksumType   = 'sha256'

$toolsDir       = Get-ToolsLocation
$kotlin_home    = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"

# Rename unzipped folder
Rename-Item "$toolsDir\kotlinc" "$kotlin_home"

Install-ChocolateyEnvironmentVariable -VariableName 'KOTLIN_HOME' -VariableValue "$kotlin_home" -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "%KOTLIN_HOME%\bin" -PathType 'Machine'
