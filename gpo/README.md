# Stratégies de groupe (GPO)

Trois GPO documentées pour le lab. Les captures d'écran de la configuration réelle et
l'export (`Backup-GPO`) sont à produire dans la VM — voir
[`../captures/TODO-PREUVE_gpo.md`](../captures/TODO-PREUVE_gpo.md).

## Tableau des GPO

| GPO | Portée (OU liée) | Effet |
|---|---|---|
| `Pol-MotDePasse` | Domaine (`lab.local`) | Longueur min. 12, complexité, historique 24, âge max 90 j. Appliquée aussi via `Set-PasswordPolicy.ps1`. |
| `Pol-Verrouillage` | Domaine (`lab.local`) | Verrouillage après 5 échecs, 15 min. Condition clé pour générer des Event ID 4740 + rafales de 4625. |
| `Pol-LecteurReseau` | `OU=Employes` | Monte un lecteur réseau `P:` (partage départemental) à l'ouverture de session. |

## Points de vérification

- Appliquer `gpupdate /force` sur `CLIENT01` puis `gpresult /h rapport.html` pour
  prouver l'application effective.
- Pour la politique de mot de passe/verrouillage : `net accounts` sur un membre du domaine.
- Le lecteur `P:` doit apparaître dans l'explorateur de `CLIENT01` pour un utilisateur
  de l'OU `Employes`.

## Export des GPO

Dans la VM, exporter réellement :

```powershell
# Sur DC01
Backup-GPO -All -Path C:\gpo-backup
```

Puis déposer l'export (anonymisé si besoin) dans ce dossier.
