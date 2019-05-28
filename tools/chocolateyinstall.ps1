$ErrorActionPreference = 'Stop'; 

$packageName = $env:ChocolateyPackageName
$url64       = 'https://download.ni.com/support/nipkg/products/ni-4/ni-488.2/19.0/online/ni-488.2_19.0_online.exe' 
$checksum64  = '959520772c4710829433fd73f00e62b0b23530345fbbd1775197a27dc62d26bf'
# $workSpace    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$WorkSpace   = Join-Path $env:TEMP "$packageName.$env:chocolateyPackageVersion"

$WebFileArgs = @{
  packageName         = $packageName
  FileFullPath        = Join-Path $WorkSpace "ni-488.2_19.0_online.exe"
  Url64bit            = $url64
  Checksum64          = $checkSum64
  ChecksumType        = 'sha256'
  GetOriginalFileName = $true
  SoftwareName        = 'NI-488dot2*'
}

$PackedInstaller = Get-ChocolateyWebFile @WebFileArgs


$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $workSpace
  fileType       = 'EXE'
  url64bit       = $url64
  softwareName   = 'NI-488dot2*' 
  checksum64     = $checkSum64
  checksumType64 = 'sha256' 
  silentArgs     = "/Q" 
}

Install-ChocolateyPackage @packageArgs
