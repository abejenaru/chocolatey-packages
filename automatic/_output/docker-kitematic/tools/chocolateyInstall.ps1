$packageName    = 'docker-kitematic'
$url64          = 'https://github.com/docker/kitematic/releases/download/v0.13.1/Kitematic-0.13.1-Windows.zip'
$checksum64     = 'a0aabd6d1ab036455c0d5f7688e81d527955c63d24029e9ae262d2732a1cf943'
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
