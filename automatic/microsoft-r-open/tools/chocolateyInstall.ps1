$ErrorActionPreference = 'Stop';

$packageName    = '{{PackageName}}'
$packageVersion = '{{PackageVersion}}'
$url            = '{{DownloadUrl}}'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

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

  checksum64    = '{{Checksum}}'
  checksumType64= 'sha256'

  silentArgs    = "/quiet"
  validExitCodes = @(
    0, # success
    3010, # success, restart required
    2147781575 # pending restart required
  )
}

Install-ChocolateyPackage @packageArgs

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "Microsoft R Open.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$env:ProgramFiles\Microsoft\R Open\bin\x64\rgui.exe"
}
