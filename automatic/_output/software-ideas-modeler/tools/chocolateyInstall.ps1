$ErrorActionPreference = 'Stop';

$packageName= 'software-ideas-modeler'
$url        = 'https://www.softwareideas.net/Download/File/504/SoftwareIdeasModelerSetup32-10-66.exe'
$url64      = 'https://www.softwareideas.net/Download/File/503/SoftwareIdeasModelerSetup64-10-66.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url
  url64bit      = $url64

  softwareName  = 'Software Ideas Modeler*'

  checksum      = '18dcdcec49799686ab0eb44e07f1ee230e659c6326218b2571c540a4a2451705'
  checksumType  = 'sha256'
  checksum64    = '64a7d4a76a1512379eafe903e211614b95ee69646ae3840a927b0b85557d36ec'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
