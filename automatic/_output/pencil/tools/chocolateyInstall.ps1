$ErrorActionPreference = 'Stop';

$packageName= 'pencil'
$url        = 'http://pencil.evolus.vn/dl/V3.0.0/Pencil-Setup-3.0.0.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Pencil*'

  checksum      = '57292b48658ce69f38cf23a9f81c30050897389d92e84fb5306faadb64c3d029'
  checksumType  = 'sha256'
  
  silentArgs   = '/S' # NSIS
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
