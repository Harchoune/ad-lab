# TODO-PREUVE — GPO

**Manip :**
1. Créer les 3 GPO décrites dans `gpo/README.md` (Pol-MotDePasse, Pol-Verrouillage,
   Pol-LecteurReseau) et les lier aux bonnes OU.
2. `gpupdate /force` sur CLIENT01, puis `gpresult /h gpresult.html`.
3. `Backup-GPO -All -Path C:\gpo-backup` sur DC01.

**Fichiers attendus :**
- `gpo_liste.png` : console de gestion des stratégies de groupe.
- `gpresult.html` : preuve d'application sur le client.
- export `gpo-backup/` (anonymisé) déposé dans `gpo/`.
- `lecteur_reseau_P.png` : lecteur P: monté sur le client.
