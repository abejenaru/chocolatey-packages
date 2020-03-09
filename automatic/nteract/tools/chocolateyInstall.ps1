$ErrorActionPreference = 'Stop';

$packageName= '{{PackageName}}'
$url        = '{{DownloadUrl}}'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'nteract*'

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'

  silentArgs   = '/S' # NSIS
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs

# Install ipykernel to get started directly
# try {
#   Start-ChocolateyProcessAsAdmin "&python -m pip install ipykernel"
#   Start-ChocolateyProcessAsAdmin "&python -m ipykernel install --user"    
# } catch {}
