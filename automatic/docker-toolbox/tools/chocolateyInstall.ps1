$ErrorActionPreference = 'Stop';

$packageName= '{{PackageName}}'
$url        = '{{DownloadUrl}}'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Docker Toolbox*'

  checksum      = '{{Checksum}}'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /COMPONENTS="Docker,DockerMachine,DockerCompose"' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
