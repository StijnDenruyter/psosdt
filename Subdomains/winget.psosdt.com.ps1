Function Install-PSOSDTWinget {
	[CmdletBinding()]
	Param ()

	$ProgressPreference = "SilentlyContinue"

	If (Get-Command -Name "winget" -ErrorAction SilentlyContinue) {
		Write-Verbose "Winget is already installed"
	}
	Else {
		Write-Verbose "Installing Microsoft Winget..."
		Try {
			If (-Not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
				Write-Verbose "Installing NuGet Package Provider..."
				Install-PackageProvider -Name NuGet -Force | Out-Null
				Write-Verbose "Successfully installed NuGet Package Provider"
			}
		}
		Catch {
			Write-Error "Failed to install NuGet Package Provider"
			#Exit
		}
		Try {
			If (-Not (Get-InstalledModule -Name Microsoft.WinGet.Client -ErrorAction SilentlyContinue)) {
				Write-Verbose "Installing Winget PowerShell module..."
				Install-Module -Name Microsoft.WinGet.Client -Force -Repository PSGallery | Out-Null
				Write-Verbose "Successfully installed Winget PowerShell module"
			}
		}
		Catch {
			Write-Error "Failed to install Winget PowerShell module"
			#Exit
		}
		Try {
			Write-Verbose "Repair Winget Package Manager..."
			Repair-WinGetPackageManager -AllUsers -Latest -Force | Out-Null
			Write-Verbose "Successfully repaired Winget Package Manager"
		}
		Catch {
			Write-Error "Failed to repair Winget Package Manager"
			#Exit
		}
		Write-Verbose "Successfully installed Microsoft Winget"		
	}
}
