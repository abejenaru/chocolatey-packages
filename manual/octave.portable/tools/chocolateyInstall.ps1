$version    = '4.2.0'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$progDir    = "$toolsDir\octave-$version"

$osBitness  = Get-ProcessorBits

$baseUrl    = "https://ftp.gnu.org/gnu/octave/windows"
$file       = "octave-$version-w32.zip"
$file64     = "octave-$version-w64.zip"
$url        = "$baseUrl/$file"
$url64      = "$baseUrl/$file64"
$checksum   = 'c2162d330232f14060d539014e5b7b785dec0c4501af0f3a9d690ef0ea4c9f6d'
$checksum64 = '58ac8da90984bfb241dbab68b9857776ceee32b01176085bd6e4f01ca5a3d91f'


Install-ChocolateyZipPackage -PackageName 'octave.portable' -Url "$url" -Url64 "$url64" -UnzipLocation "$toolsDir" -ChecksumType 'sha256' -Checksum "$checksum" -Checksum64 "$checksum64"

# Rename unzipped folder
Rename-Item "$toolsDir\octave-$version-w$osBitness" "$progDir"

# Don't create shims for any executables
$files = get-childitem "$toolsDir" -include *.exe -exclude octave-cli.exe -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}
# Link batch
Install-BinFile -Name "octave" -Path "$progDir\bin\octave-cli.exe"

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "Octave $version (Portable).lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$progDir\octave.vbs" -WorkingDirectory "$progDir" -Arguments '--force-gui' -IconLocation "$progDir\share\octave\4.2.0\imagelib\octave-logo.ico"
}
