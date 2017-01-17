$ErrorActionPreference = 'Stop';

$packageName= '{{PackageName}}'
$url        = '{{DownloadUrl}}'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Pencil*'

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'
  
  # OTHERS
  silentArgs   = '/S'           # NSIS
}

Install-ChocolateyPackage @packageArgs
