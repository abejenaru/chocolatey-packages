
# Remove desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "Microsoft R Open.lnk"
If (Test-Path $link) {
    Remove-Item "$link"
}
