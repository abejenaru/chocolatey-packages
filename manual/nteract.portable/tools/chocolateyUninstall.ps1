﻿$packageName= 'nteract'
$version    = '0.0.15'


# Remove desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "$packageName.lnk"
If (Test-Path $link) {
    Remove-Item "$link"
}
