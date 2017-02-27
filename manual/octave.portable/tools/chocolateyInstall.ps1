$packageName    = 'octave.portable'
$packageVersion = '4.2.0'

$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$progDir        = "$toolsDir\octave"

$osBitness      = Get-ProcessorBits

$baseUrl        = "https://ftp.gnu.org/gnu/octave/windows"
$url            = "$baseUrl/octave-$packageVersion-w32.zip"
$url64          = "$baseUrl/octave-$packageVersion-w64.zip"
$checksum       = '4be2c451a2757b80f21bfc06d48a59a49e5ed00b0461471da9bce565efac79fa'
$checksum64     = '58ac8da90984bfb241dbab68b9857776ceee32b01176085bd6e4f01ca5a3d91f'
$checksumType   = 'sha256'
$checksumType64 = 'sha256'


Install-ChocolateyZipPackage -PackageName "$packageName" -UnzipLocation "$toolsDir" -Url "$url" -Url64 "$url64" -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"

# Rename unzipped folder
Rename-Item "$toolsDir\octave-$packageVersion" "$progDir"

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
