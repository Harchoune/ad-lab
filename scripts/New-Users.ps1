<#
.SYNOPSIS
    Crée en masse des comptes utilisateurs AD depuis un CSV.
.DESCRIPTION
    À exécuter sur DC01. Lit scripts/users.sample.csv (données FICTIVES) et crée un
    compte par ligne dans l'OU indiquée. Le mot de passe initial n'est PAS stocké dans
    le dépôt : il est demandé interactivement au lancement et appliqué à tous les comptes,
    avec changement obligatoire à la première connexion.
.NOTES
    Ne jamais committer de vrais mots de passe. Le CSV ne contient aucun secret.
#>

param(
    [string]$CsvPath = "$PSScriptRoot\users.sample.csv",
    [string]$BaseDN  = "DC=lab,DC=local"
)

Import-Module ActiveDirectory -ErrorAction Stop

# Mot de passe initial demandé à l'exécution (jamais écrit sur disque)
$InitialPassword = Read-Host -AsSecureString "Mot de passe initial des comptes"

Import-Csv -Path $CsvPath | ForEach-Object {
    $sam = $_.SamAccountName
    $ouDN = "OU=$($_.OU),$BaseDN"

    if (Get-ADUser -Filter "SamAccountName -eq '$sam'" -ErrorAction SilentlyContinue) {
        Write-Host "Utilisateur déjà présent : $sam" -ForegroundColor Yellow
        return
    }

    New-ADUser `
        -Name              "$($_.GivenName) $($_.Surname)" `
        -GivenName         $_.GivenName `
        -Surname           $_.Surname `
        -SamAccountName    $sam `
        -UserPrincipalName "$sam@lab.local" `
        -Title             $_.Title `
        -Department        $_.Department `
        -Path              $ouDN `
        -AccountPassword   $InitialPassword `
        -ChangePasswordAtLogon $true `
        -Enabled           $true

    Write-Host "Utilisateur créé : $sam ($ouDN)" -ForegroundColor Green
}
