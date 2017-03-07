$ErrorActionPreference = 'Stop';

$packageName= 'software-ideas-modeler'
$url        = 'https://www.softwareideas.net/Download/File/508/SoftwareIdeasModelerSetup32-10-67.exe'
$url64      = 'https://www.softwareideas.net/Download/File/507/SoftwareIdeasModelerSetup64-10-67.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Software Ideas Modeler*'

  checksum      = '885b8bd9c6b92a98513445fa655018d6fda184daaed530fc1a66be8354ffb513'
  checksumType  = 'sha256'
  checksum64    = 'd028230582933a00bac6f57bd770aca4f522a4faa3b1ceaf867600ef46420e71'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
