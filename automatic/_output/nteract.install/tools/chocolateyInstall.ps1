$ErrorActionPreference = 'Stop';

$packageName= 'nteract.install'
$url        = 'https://github.com/nteract/nteract/releases/download/v0.1.0/nteract.Setup.0.1.0.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'nteract*'

  checksum      = 'b66affe1b48f2e8479beba8743a8e288c10010c17b6eb46c3743f656ad13dd9d'
  checksumType  = 'sha256'

  silentArgs   = '/S' # NSIS
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

# Install ipykernel to get started directly
Start-ChocolateyProcessAsAdmin "&python -m pip install ipykernel"
Start-ChocolateyProcessAsAdmin "&python -m ipykernel install --user"
