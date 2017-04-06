$packageName    = 'docker-kitematic'
$url64          = 'https://github.com/docker/kitematic/releases/download/v0.17.0/Kitematic-0.17.0-Windows.zip'
$checksum64     = '4eb7887567ac4df604ed288cb6d8da2f95e8a183930bfcede117ab0a72be6fac'
$checksumType64 = 'sha256'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url64 "$url64" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

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
