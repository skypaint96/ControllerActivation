$queryNew = 'SELECT * FROM __instancecreationevent WITHIN 5 WHERE TargetInstance ISA ''Win32_PnPEntity''';
$actionNew = { if($EventArgs.NewEvent.TargetInstance.Caption -eq 'HID-Compliant game controller'){Start-Process -Path 'shell:AppsFolder\XBMCFoundation.Kodi_4n2hpmxwrvr6p!Kodi'}};
Register-CimIndicationEvent -Query $queryNew -SourceIdentifier 'WMI.PnPAddEvent' -Action $actionNew;

$queryDel = 'SELECT * FROM __instancedeletionevent WITHIN 5 WHERE TargetInstance ISA ''Win32_PnPEntity''';
$actionDel = { if($EventArgs.NewEvent.TargetInstance.Caption -eq 'HID-Compliant game controller'){Stop-Process -Name 'Kodi'}};
Register-CimIndicationEvent -Query $queryDel -SourceIdentifier 'WMI.PnPRemoveEvent' -Action $actionDel;
