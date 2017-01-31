$ErrorActionPreference = 'Stop';

$packageName= 'docker-toolbox'
$url        = 'https://github.com/docker/toolbox/releases/download/v1.13.0/DockerToolbox-1.13.0.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Docker Toolbox*'

  checksum      = 'ecf569cfe8d7134afbba3a877a16f630044f19912313af8194cc74d02d741242'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /COMPONENTS="Docker,DockerMachine,DockerCompose"' # Inno Setup
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
