<#
.SYNOPSIS
    Crée la structure d'unités d'organisation (OU) du domaine lab.local.
.DESCRIPTION
    À exécuter sur DC01 (PowerShell en administrateur, module ActiveDirectory).
    Idempotent : une OU déjà présente est ignorée.
.NOTES
    Lab pédagogique — domaine lab.local. Adapter le DN à votre domaine réel.
#>

Import-Module ActiveDirectory -ErrorAction Stop

# Domaine cible (adapter si différent de lab.local)
$BaseDN = "DC=lab,DC=local"

# OU à créer sous la racine du domaine
$OrgUnits = @("Employes", "IT", "Serveurs")

foreach ($ou in $OrgUnits) {
    $ouDN = "OU=$ou,$BaseDN"
    if (Get-ADOrganizationalUnit -Filter "Name -eq '$ou'" -SearchBase $BaseDN -ErrorAction SilentlyContinue) {
        Write-Host "OU déjà présente : $ou" -ForegroundColor Yellow
    }
    else {
        New-ADOrganizationalUnit -Name $ou -Path $BaseDN -ProtectedFromAccidentalDeletion $true
        Write-Host "OU créée : $ou" -ForegroundColor Green
    }
}
