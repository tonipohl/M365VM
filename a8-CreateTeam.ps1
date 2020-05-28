#---------------------------------------------------------------------------------------
# a8-CreateTeam-webhook.ps1 
# Create a new team with the Teams module. Requires MicrosoftTeams
# @atwork
#---------------------------------------------------------------------------------------
# https://docs.microsoft.com/en-us/powershell/module/teams/new-team?view=teams-ps

param
(
	[Parameter (Mandatory=$true)]
	[string] $teamname = "Team30",
	[Parameter (Mandatory=$false)]
	[string] $owner = "admin@M365x251516.onmicrosoft.com"
)

Write-Output "$(Get-Date) Create Team $teamname..."

$tenant = Get-AutomationVariable -Name "tenantname"
$cred = Get-AutomationPSCredential -Name 'NestorW'

Connect-MicrosoftTeams -Credential $cred
Write-Output "$(Get-Date) connect."

$group = New-Team -MailNickname $teamname -displayname $teamname -Visibility "private"
Write-Output "$(Get-Date) new team $teamname."

Add-TeamUser -GroupId $group.GroupId -Owner $owner

Add-TeamUser -GroupId $group.GroupId -User $owner
Add-TeamUser -GroupId $group.GroupId -User "AlexW@M365x251516.OnMicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "ChristieC@M365x251516.OnMicrosoft.com"
Add-TeamUser -GroupId $group.GroupId -User "MiriamG@M365x251516.OnMicrosoft.com"
Write-Output "$(Get-Date) team $($teamname) members added."

New-TeamChannel -GroupId $group.GroupId -DisplayName "Team project planning"
New-TeamChannel -GroupId $group.GroupId -DisplayName "Contracts"
Write-Output "$(Get-Date) $($teamname) channels added."

