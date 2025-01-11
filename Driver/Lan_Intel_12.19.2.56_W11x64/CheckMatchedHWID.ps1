
echo "[PS1]  Push-Location $PSScriptRoot"
Push-Location "$PSScriptRoot"

Function CheckMatchedHWID {
	Write-Information "[PS1][CheckMatchedHWID]  Processing $MOD_HWID" -InformationAction Continue
	$bHWIDMatched = $false
    $HWIDs = $MOD_HWID.Split(';')
    Foreach ($HWID in $HWIDs) {
		Write-Information "[PS1][CheckMatchedHWID]  Checking [$HWID] if existing in this device." -InformationAction Continue
		$SEL = Select-String -Path .\Pnputil_deviceids_WinPE.txt -Pattern $HWID -SimpleMatch
		if ($SEL -ne $null) {
			Write-Information "[PS1][CheckMatchedHWID]  Getting the resulting from device is $SEL"  -InformationAction Continue
			Write-Information "[PS1][CheckMatchedHWID]  HWID is matched with device."  -InformationAction Continue
			$bHWIDMatched = $true
		}
		else
		{
			Write-Information "[PS1][CheckMatchedHWID]  HWID not matched with device." -InformationAction Continue
		}
    }
	if ($MOD_HWID -eq "MUST")
	{
		Write-Information "[PS1][CheckMatchedHWID]  This is MUST case. return bHWIDMatched as true." -InformationAction Continue
		$bHWIDMatched = $true
	}
	return $bHWIDMatched
}



$XMLPath = "Prepackage.xml"
[xml] $X_Content = Get-Content "$XMLPath" -Encoding UTF8
$MOD_Class = $X_Content.ModuleInfo.Module.Class
echo "[PS1]  Module Class is $MOD_Class"
$MOD_Name = $X_Content.ModuleInfo.Module.Name
echo "[PS1]  Module Name is $MOD_Name"
$MOD_HWID = $X_Content.ModuleInfo.HWIDs
echo "[PS1]  Module HWIDs is $MOD_HWID"

echo "[PS1]  call function CheckMatchedHWID"
# $bHWIDMatched scope in function only."
$bHWIDMatched_G = CheckMatchedHWID
echo "[PS1]  Got bHWIDMatched_G=$bHWIDMatched_G"
Pop-Location

if ($bHWIDMatched_G -eq $false)
{
	ECHO "[PS1]  bHWIDMatched_G is false. Driver cannot be installed"		
	# return code 5 mean driver cannot be installed
	exit 5
}
else
{
	ECHO "[PS1]  bHWIDMatched_G is true. Driver can be installed."
	# return code 9 mean can be installed
	exit 9
}
