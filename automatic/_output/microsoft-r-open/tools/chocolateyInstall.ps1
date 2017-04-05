$ErrorActionPreference = 'Stop';

$packageName    = 'microsoft-r-open'
$packageVersion = '3.3.3'
$url            = 'https://mran.microsoft.com/install/mro/3.3.3/microsoft-r-open-3.3.3.exe'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$osBitness      = Get-ProcessorBits

# check OS bitness
if (!([Environment]::Is64BitOperatingSystem)) {
  Write-Error "Microsoft R Open requires 64bit operating system"
  exit
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = $url

  softwareName  = 'Microsoft R Open*'

  checksum64    = '7a752f887e24e9085fd8888b38a162e3647c0204033d8025f138414ef360a729'
  checksumType64= 'sha256'

  silentArgs    = '/verysilent /suppressmsgboxes'
  validExitCodes= @(0, 3010)
}

Install-ChocolateyPackage @packageArgs

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$installDir = "$env:ProgramFiles\Microsoft\MRO-$packageVersion"
$link = Join-Path $desktop "Microsoft R Open.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$installDir\bin\x$osBitness\rgui.exe"
}
