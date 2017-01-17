$ErrorActionPreference = 'Stop';

$packageName    = 'microsoft-r-open'
$packageVersion = '3.3.2'
$url            = 'https://mran.microsoft.com/install/mro/3.3.2/microsoft-r-open-3.3.2.msi'

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
  fileType      = 'MSI'
  url64         = $url

  softwareName  = 'Microsoft R Open*'

  checksum64    = '198e23d1a336c7f7be6a50dbde8c80a59bccbd2dff8364f5c5df6f9d2f1f6865'
  checksumType64= 'sha256'

  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$installDir = "$env:ProgramFiles\Microsoft\MRO-$packageVersion"
$link = Join-Path $desktop "Microsoft R Open.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$installDir\bin\x$osBitness\rgui.exe"
}
