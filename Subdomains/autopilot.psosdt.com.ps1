Function Get-PSOSDTAutopilotESPDiagnostics {
	If (-Not (Get-InstalledScript -Name Get-IntuneManagementExtensionDiagnostics -ErrorAction SilentlyContinue)) {
		Install-Script -Name Get-IntuneManagementExtensionDiagnostics -Force
	}
	Get-IntuneManagementExtensionDiagnostics
}