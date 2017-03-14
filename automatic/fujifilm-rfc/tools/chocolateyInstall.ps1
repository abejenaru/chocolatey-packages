$ErrorActionPreference = 'Stop';

$packageName= 'fujifilm-rfc'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = '{{DownloadUrl}}'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'fujifilm-rfc*'

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'

  # InstallShield
  silentArgs   = '/s'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
