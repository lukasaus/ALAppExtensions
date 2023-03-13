Param(
    [Parameter(Mandatory = $true)]
    [string]$Owner = "aholstrup1",
    [Parameter(Mandatory = $true)]
    [string]$Repo = "AlAppExtensions",
    [Parameter(Mandatory = $true)]
    [string]$Token
)

Import-Module $PSScriptRoot\EnlistmentHelperFunctions.psm1

$latestBaseline = Get-LatestBaselineVersionFromArtifacts
$currentBaseline = Get-ConfigValueFromKey -Key "baselineVersion" -ConfigType "BuildConfig" 

if ([System.Version] $latestBaseline -gt [System.Version] $currentBaseline) {
    Write-Host "Updating baseline version from $currentBaseline to $latestBaseline" -ForegroundColor Yellow
}

$Title = "Update baseline version to $latestBaseline"

$Head = ""
$Base = ""

# This function creates a pull request in Github with the current branch
function New-GitHubPullRequest {
    param(
        [string]$Owner = "aholstrup1",
        [string]$Repo = "AlAppExtensions",
        [string]$Title = "Test PR creation",
        [string]$Body = $Title,
        [string]$Head = "test-pr",
        [string]$Base = "main",
        [string]$Token
    )

    $uri = "https://api.github.com/repos/$Owner/$Repo/pulls"
    $headers = @{
        "Authorization" = "token $Token"
        "Content-Type"  = "application/json"
    }

    $body = @{
        "title" = $Title
        "body"  = $Body
        "head"  = $Head
        "base"  = $Base
    } | ConvertTo-Json

    Invoke-RestMethod -Uri $uri -Headers $headers -Method Post -Body $body
}
