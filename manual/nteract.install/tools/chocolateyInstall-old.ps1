$packageName    = 'nteract'
$packageVersion = '0.0.15'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$softwareDir= "$toolsDir/nteract"
$softwareExe= "$softwareDir/nteract.exe"

$baseUrl    = "https://github.com/nteract/nteract/releases/download/v$packageVersion"
$url        = "$baseUrl/nteract-$packageVersion.exe"
$checksum   = '95d0a97e49c9e9cb376274e3ea998852cd838dd0e63ed50018f4e03497f60c3f'


Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" -UnzipLocation "$toolsDir" -ChecksumType 'sha256' -Checksum "$checksum"

# Rename unzipped folder
Rename-Item "$toolsDir\win-unpacked" "$softwareDir"

# Don't create shims for anything other than main exe
$files = get-childitem "$toolsDir" -include *.exe -exclude 'nteract.exe' -recurse
foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
}

# Create desktop shortcut
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop 'nteract.lnk'
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath "$softwareExe" -WorkingDirectory "$softwareDir"
}

# Associate file extension
Install-ChocolateyFileAssociation -Extension '.ipynb' -Executable "$softwareExe"


# Install ipykernel to get started directly
Start-ChocolateyProcessAsAdmin "&python -m pip install ipykernel"
Start-ChocolateyProcessAsAdmin "&python -m ipykernel install --user"
