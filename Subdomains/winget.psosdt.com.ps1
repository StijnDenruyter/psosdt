Function Install-PSOSDTWinget {
	[CmdletBinding()]
	Param ()

	$ProgressPreference = "SilentlyContinue"

	Write-Verbose "Installing Winget PowerShell module from PSGallery..."
	Try {
		Install-PackageProvider -Name NuGet -Force | Out-Null
		Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
		Write-Verbose "Successfully installed Winget PowerShell module"
	}
	Catch {
		Write-Error "Failed to install Winget PowerShell module"
		Exit
	}
	Write-Verbose "Using Repair-WinGetPackageManager cmdlet to bootstrap Winget..."
	Try {
		Repair-WinGetPackageManager -AllUsers -Latest -Force
		Write-Verbose "Successfully repaired Winget Package Manager"
	}
	Catch {
		Write-Error "Failed to repair Winget Package Manager"
		Exit
	}
	Write-Verbose "Successfully installed WinGet"
}