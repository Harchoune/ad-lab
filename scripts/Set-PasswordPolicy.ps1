<#
.SYNOPSIS
    Durcit la politique de mot de passe et de verrouillage de compte du domaine.
.DESCRIPTION
    À exécuter sur DC01. Applique une politique de domaine (Default Domain Policy)
    alignée sur les recommandations usuelles : longueur minimale, complexité,
    historique, et verrouillage après plusieurs échecs (utile pour la détection
    de brute force — voir detection/wazuh).
.NOTES
    Les seuils sont pédagogiques ; les ajuster au besoin.
#>

Import-Module ActiveDirectory -ErrorAction Stop

Set-ADDefaultDomainPasswordPolicy -Identity "lab.local" `
    -MinPasswordLength 12 `
    -ComplexityEnabled $true `
    -PasswordHistoryCount 24 `
    -MaxPasswordAge (New-TimeSpan -Days 90) `
    -MinPasswordAge (New-TimeSpan -Days 1) `
    -LockoutThreshold 5 `
    -LockoutDuration (New-TimeSpan -Minutes 15) `
    -LockoutObservationWindow (New-TimeSpan -Minutes 15)

Write-Host "Politique de mot de passe et de verrouillage appliquée." -ForegroundColor Green
Get-ADDefaultDomainPasswordPolicy
