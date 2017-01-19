$ErrorActionPreference = 'Stop';

$packageName= 'nteract.install'
$url        = 'https://github.com/nteract/nteract/releases/download/v0.0.15/nteract-0.0.15.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'nteract*'

  checksum      = '95d0a97e49c9e9cb376274e3ea998852cd838dd0e63ed50018f4e03497f60c3f'
  checksumType  = 'sha256'

  silentArgs   = '/S' # NSIS
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

# Install ipykernel to get started directly
Start-ChocolateyProcessAsAdmin "&python -m pip install ipykernel"
Start-ChocolateyProcessAsAdmin "&python -m ipykernel install --user"
