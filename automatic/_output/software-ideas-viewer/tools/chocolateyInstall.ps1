$ErrorActionPreference = 'Stop';

$packageName= 'software-ideas-viewer'
$url        = 'https://www.softwareideas.net/Download/File/472/Software-Ideas-Viewer-10-41.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Software Ideas Viewer*'

  checksum      = 'a8d51dd2c13f726f59bfd5f29b1ac902bcbf0ecea01bacc1661b8b74ecb1cabc'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
