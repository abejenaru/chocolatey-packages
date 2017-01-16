$packageName    = '{{PackageName}}'
$url64          = '{{DownloadUrl}}'
$checksum64     = '{{Checksum}}'
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
