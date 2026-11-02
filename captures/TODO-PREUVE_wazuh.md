# TODO-PREUVE — Détection Wazuh (4625 / brute force)

**Préalable manquant :** aucune VM/conteneur Wazuh dans l'inventaire actuel.

**Manip :**
1. Déployer un manager Wazuh ; enrôler l'agent sur DC01 (canal Security).
2. Activer l'audit des échecs de logon (auditpol, voir ossec.conf.sample).
3. Déposer `detection/wazuh/local_rules.xml`, redémarrer le manager.
4. Rejouer le brute force RDP/SMB (voir `detection/wazuh/brute_force_rdp_smb.md`)
   vers un compte de TEST uniquement.
5. Vérifier les règles avec `wazuh-logtest` sur un événement 4625 réel.

**Fichiers attendus :**
- `wazuh_logtest_4625.txt` : preuve de match des règles 100200/100201.
- `wazuh_alert_bruteforce.png` : alerte réelle (dashboard).
- `event_4625.png`, `event_4740.png` : événements Windows côté DC01.
