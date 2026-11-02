# TODO-PREUVE — Administration AD (OU, utilisateurs, politique)

**Manip (sur DC01, PowerShell admin) :**
1. `.\scripts\New-OU.ps1` → créer Employes / IT / Serveurs.
2. `.\scripts\New-Users.ps1` → créer les comptes du CSV fictif (mot de passe saisi au lancement).
3. `.\scripts\Set-PasswordPolicy.ps1` → appliquer la politique.

**Fichiers attendus :**
- `ou_structure.png` : console « Utilisateurs et ordinateurs AD » montrant les OU + comptes.
- `password_policy.png` : sortie `net accounts` ou `Get-ADDefaultDomainPasswordPolicy`.
