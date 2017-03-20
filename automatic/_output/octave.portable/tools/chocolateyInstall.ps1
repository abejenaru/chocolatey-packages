$packageName    = 'octave.portable'
$packageVersion = '4.2.1'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$progDir        = "$toolsDir\octave"

$osBitness      = Get-ProcessorBits

$url            = 'https://ftp.gnu.org/gnu/octave/windows/octave-4.2.1-w32.zip'
$url64          = 'https://ftp.gnu.org/gnu/octave/windows/octave-4.2.1-w32.zip'
$checksum       = '4be2c451a2757b80f21bfc06d48a59a49e5ed00b0461471da9bce565efac79fa'
$checksum64     = '4be2c451a2757b80f21bfc06d48a59a49e5ed00b0461471da9bce565efac79fa'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Url64 "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Rename unzipped folder
If (Test-Path "$toolsDir\octave-$packageVersion-w$osBitness") {
  Rename-Item "$toolsDir\octave-$packageVersion-w$osBitness" "$progDir"
}
If (Test-Path "$toolsDir\octave-$packageVersion") {
  Rename-Item "$toolsDir\octave-$packageVersion" "$progDir"
}

# Don't create shims for any executables
$files = get-childitem "$toolsDir" -include *.exe -exclude octave-cli.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
# Link batch
Install-BinFile -Name "octave" -Path "$progDir\bin\octave-cli.exe"

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "Octave.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$progDir\octave.vbs" -WorkingDirectory "$progDir" -Arguments '--force-gui' -IconLocation "$progDir\share\octave\$packageVersion\imagelib\octave-logo.ico"
}
