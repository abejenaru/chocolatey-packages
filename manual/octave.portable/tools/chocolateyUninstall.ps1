$version    = '4.2.0'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$progDir    = "$toolsDir\octave-$version"


# Remove desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "Octave $version (Portable).lnk"
If (Test-Path $link) {
    Remove-Item "$link"
}

# Unlink batch
Uninstall-BinFile -Name "octave" -Path "$progDir\bin\octave-cli.exe"
