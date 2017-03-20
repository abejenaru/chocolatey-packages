$ErrorActionPreference = 'Stop';

$packageName= 'ealite'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.sparxsystems.com/bin/EALite.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Enterprise Architect*'

  checksum      = '33169c88263b096cdedb35bafc3f0de94a9c6cea6a7722b3ddf761ffb0affb65'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
