$ErrorActionPreference = 'Stop';

$packageName= 'fujifilm-rfc'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://download.fujifilm.co.jp/pub/tools/silkypix2_win_4260_ead9djyd/SILKYRFCInstaller20.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'fujifilm-rfc*'

  checksum      = 'cc7d9fc182da82763240902bb8a3ca4eedc6c03d684d6222cf960e898efde74e'
  checksumType  = 'sha256'

  # InstallShield
  silentArgs   = '/s'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
