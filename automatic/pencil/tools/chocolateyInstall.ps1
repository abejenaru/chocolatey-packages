$ErrorActionPreference = 'Stop';

$packageName= '{{PackageName}}'
$version    = '{{PackageVersion}}'
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
  
  #OTHERS
  silentArgs   = '/S'           # NSIS
  #validExitCodes= @(0) #please insert other valid exit codes here
}

Install-ChocolateyPackage @packageArgs
