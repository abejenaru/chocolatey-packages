$ErrorActionPreference = 'Stop';

$packageName= 'pencil'
$version    = '2.0.21'
$url        = 'https://github.com/prikhi/pencil/releases/download/v2.0.21/Pencil-2.0.21-win32.installer.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Pencil*'

  checksum      = '34739e9cf0ea8bedf08dc9dcbcb473d5b99ce06a060c10ed277e3c092782ff39'
  checksumType  = 'sha256'
  
  #OTHERS
  silentArgs   = '/S'           # NSIS
  #validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyPackage @packageArgs
