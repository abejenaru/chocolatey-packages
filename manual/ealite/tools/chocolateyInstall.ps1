$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'ealite'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www.sparxsystems.com/bin/EALite.msi'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url

  softwareName  = 'Enterprise Architect*'

  checksum      = 'c6250de184ae33c0f6de45b55cf914c7e6ee36e5a698326738908ed9d2b7b9eb'
  checksumType  = 'sha256'
  
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
