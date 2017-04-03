$packageName    = $env:chocolateyPackageName
$packageVersion = $env:chocolateyPackageVersion

$toolsDir       = Get-ToolsLocation
$kotlin_home    = Join-Path $toolsDir "$packageName-$packageVersion"

Remove-Item $kotlin_home -Recurse -Force

Install-ChocolateyEnvironmentVariable -VariableName 'KOTLIN_HOME' -VariableValue $null -VariableType 'Machine'
