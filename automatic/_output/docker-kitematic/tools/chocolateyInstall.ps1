$packageName    = 'docker-kitematic'
$url64          = 'https://github.com/docker/kitematic/releases/download/v0.12.0/Kitematic-0.12.0-Windows.zip'
$checksum64     = '924a8c5021589f401b2f86373cb3378518b89cf695ad416d3307c2dac461d4c5'
$checksumType64 = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -Url64 "$url64" -UnzipLocation "$toolsDir" -ChecksumType64 "$checksumType64" -Checksum64 "$checksum64"

# check OS bitness
if (!([Environment]::Is64BitOperatingSystem)) {
    Write-Error "Kitematic requires 64bit operating system"
    exit
}

# Don't create shims for anything other than Kitematic
$files = get-childitem "$toolsDir" -include *.exe -exclude Kitematic.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "Kitematic.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$toolsDir\Kitematic.exe" -WorkingDirectory "$toolsDir"
}
