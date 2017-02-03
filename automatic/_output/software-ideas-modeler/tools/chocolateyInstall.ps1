$ErrorActionPreference = 'Stop';

$packageName= 'software-ideas-modeler'
$url        = 'https://www.softwareideas.net/Download/File/500/SoftwareIdeasModelerSetup32-10-65.exe'
$url64      = 'https://www.softwareideas.net/Download/File/499/SoftwareIdeasModelerSetup64-10-65.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Software Ideas Modeler*'

  checksum      = 'df51b402d971acdca7dd5705bf7672267c8e0284b26a549ee22bfe1791e057ab'
  checksumType  = 'sha256'
  checksum64    = '9ab1283bfb3c027fdcbfe4bc3ebca0d391075cd901ffd07e8121067eb7009e40'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
