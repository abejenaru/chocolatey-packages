$ErrorActionPreference = 'Stop';

$packageName= 'microsoft-r-open'

# Uninstall previous versions
$silentArgs = '/qn /norestart'
$validExitCodes = @(0, 3010, 1605, 1614, 1641)

[array]$key = Get-UninstallRegistryKey -SoftwareName "Microsoft R Open 3.3.2*"

if ($key.Count -eq 1) {
  $key | % { 
    $silentArgs = "$($_.PSChildName) $silentArgs"

    Uninstall-ChocolateyPackage -PackageName $packageName `
                                -FileType 'MSI' `
                                -SilentArgs "$silentArgs" `
                                -ValidExitCodes $validExitCodes `
                                -File ''
  }
} elseif ($key.Count -eq 0) {
  Write-Warning "$packageName has already been uninstalled by other means."
} elseif ($key.Count -gt 1) {
  Write-Warning "$key.Count matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | % {Write-Warning "- $_.DisplayName"}
}

## OTHER HELPERS
## https://chocolatey.org/docs/helpers-reference
#Uninstall-ChocolateyZipPackage $packageName # Only necessary if you did not unpack to package directory - see https://chocolatey.org/docs/helpers-uninstall-chocolatey-zip-package
#Uninstall-ChocolateyEnvironmentVariable # 0.9.10+ - https://chocolatey.org/docs/helpers-uninstall-chocolatey-environment-variable 
#Uninstall-BinFile # Only needed if you used Install-BinFile - see https://chocolatey.org/docs/helpers-uninstall-bin-file
## Remove any shortcuts you added





$url        = 'https://mran.microsoft.com/install/mro/3.3.3/microsoft-r-open-3.3.3.exe'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

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

  checksum64    = '7f82be9191b9791c1af8e6d17e1f4b493522aebd2d6aa0f0d86a06a74881ec89'
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
