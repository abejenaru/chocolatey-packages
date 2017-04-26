$ErrorActionPreference = 'Stop';

$packageName= 'software-ideas-modeler'
$url        = 'https://www.softwareideas.net/Download/File/512/SoftwareIdeasModelerSetup32-10-68.exe'
$url64      = 'https://www.softwareideas.net/Download/File/511/SoftwareIdeasModelerSetup64-10-68.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Software Ideas Modeler*'

  checksum      = '0a45428a613d5538dadfac32bf7442442a719a96f9919217a0782a05cceb5a81'
  checksumType  = 'sha256'
  checksum64    = '00e11492fab046607d07e0cd86c40578b1f63ea8c4252c8d4df64437bee8501a'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
