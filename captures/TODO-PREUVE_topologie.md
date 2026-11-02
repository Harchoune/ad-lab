# TODO-PREUVE — Topologie et domaine

**Préalable :** les VM `DC` et `Windows-LTCS-lab` sont actuellement sur le NAT-network
VirtualBox (10.0.2.0/24). Les basculer sur un réseau interne isolé dédié au lab AD.

**Manip :**
1. Démarrer `DC`, promouvoir en contrôleur `DC01.lab.local` si pas déjà fait
   (AD DS + DNS + DHCP).
2. Joindre `Windows-LTCS-lab` (CLIENT01) au domaine `lab.local`.
3. Relever les IP réelles de chaque machine.

**Fichiers attendus :**
- `topologie_adressage.md` : IP/nom réels.
- `domaine_dcpromo.png`, `client_joint_domaine.png`.

**À mettre à jour :** IP provisoires dans `topology/README.md`.
