$ErrorActionPreference = 'Stop';

$packageName= 'pencil'
$url        = 'http://pencil.evolus.vn/dl/V3.0.1/Pencil-Setup-3.0.1.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Pencil*'

  checksum      = '96a0fd0c353388a5578080d2f1f3d07026b544dad01120d7eff3e9f96af1661a'
  checksumType  = 'sha256'
  
  silentArgs   = '/S' # NSIS
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
