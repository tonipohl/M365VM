#---------------------------------------------------------------------------------------
# a9-GetTeams.ps1 
# Create a new team with the Teams module. Requires MicrosoftTeams
# @atwork
#---------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/teams/new-team?view=teams-ps
# https://practical365.com/microsoft-365/how-to-run-powershell-scripts-to-automate-manual-processes-in-office-365/
# https://docs.microsoft.com/en-us/azure/automation/automation-first-runbook-textual#step-5---add-authentication-to-manage-azure-resources

# Connect...
$cred = Get-AutomationPSCredential -Name 'admin'
# Connect-AzAccount -Credential $cred

Write-Output "Credential : $($cred.UserName)"
Write-Output "Pwd : $($cred.Password)"

# Connect to the Teams module
Connect-MicrosoftTeams -Credential $cred

# Get a list of teams
$teams = Get-Team

Write-Output $teams | ft

Write-Output "Done. $($teams.Count()) Teams."
