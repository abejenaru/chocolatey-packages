$ErrorActionPreference = 'Stop';

$packageName= 'pencil'
$url        = 'https://github.com/evolus/pencil/releases/download/v3.0.0-rc.2/Pencil-Setup-3.0.0-rc.2.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Pencil 3*'

  checksum      = '8f251a25ad175be0bae67c7944b3370c701d22eabf2fadb383e4f2d56e8c82cd'
  checksumType  = 'sha256'
  
  silentArgs   = '/S' # NSIS
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
