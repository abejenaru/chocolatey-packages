$ErrorActionPreference = 'Stop';

$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion
$url            = 'https://github.com/JetBrains/kotlin/releases/download/v1.1.1/kotlin-compiler-1.1.1.zip'
$checksum       = 'aca2c91f6e10224df07bf523d34736c9a1f101bcf53b26104314503a57a026b1'
$checksumType   = 'sha256'

$toolsDir       = Get-ToolsLocation
$kotlin_home    = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Checksum "$checksum" -ChecksumType "$checksumType"

# Rename unzipped folder
Rename-Item "$toolsDir\kotlinc" "$kotlin_home"

Install-ChocolateyEnvironmentVariable -VariableName 'KOTLIN_HOME' -VariableValue "$kotlin_home" -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "%KOTLIN_HOME%\bin" -PathType 'Machine'
