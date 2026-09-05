$ErrorActionPreference = 'Stop'
$skinRoot = Join-Path $env:USERPROFILE 'Documents\Rainmeter\Skins'
if (-not (Test-Path $skinRoot)) { throw "Rainmeter Skins folder not found: $skinRoot" }
$files = @(Get-ChildItem $skinRoot -Recurse -Filter 'CoreLink.ini')
if ($files.Count -eq 0) {
  $dest = Join-Path $skinRoot 'CoreLink'
  New-Item -ItemType Directory -Force -Path $dest | Out-Null
  $files = @([pscustomobject]@{ FullName = (Join-Path $dest 'CoreLink.ini'); DirectoryName = $dest })
}
$stamp = [DateTimeOffset]::UtcNow.ToUnixTimeSeconds()
$iniUrl = "https://raw.githubusercontent.com/Ben-Zane/corelink-overlay/main/Rainmeter/CoreLink/CoreLink.ini?t=$stamp"
$incUrl = "https://raw.githubusercontent.com/Ben-Zane/corelink-overlay/main/Rainmeter/CoreLink/Cores.inc?t=$stamp"
foreach ($f in $files) {
  $dir = $f.DirectoryName
  Invoke-WebRequest -UseBasicParsing -Uri $iniUrl -OutFile (Join-Path $dir 'CoreLink.ini')
  Invoke-WebRequest -UseBasicParsing -Uri $incUrl -OutFile (Join-Path $dir 'Cores.inc')
  Write-Host "Updated $dir"
}
Write-Host 'Done. Rainmeter tray -> Refresh all. Subtitle must say v1.5.3'
