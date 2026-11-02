# Scénario de détection — Brute force RDP/SMB → Event ID 4625

> ⚠️ À rejouer uniquement dans le lab isolé, depuis `attacker` (Kali) vers `DC01`.
> Objectif **défensif** : générer des échecs d'authentification pour valider la chaîne
> de détection Wazuh. Ne jamais cibler une machine qu'on ne possède pas.

## Principe

Une série de tentatives d'authentification infructueuses (RDP ou SMB) contre un compte
du domaine produit, côté Windows, des événements **4625** (échec d'ouverture de session),
puis un **4740** (verrouillage) une fois le seuil atteint (GPO `Pol-Verrouillage`).

## Déroulé type

1. Choisir un compte cible **de test** du domaine (ex. `yalaoui`) — jamais un compte réel.
2. Depuis Kali, lancer un outil de test d'authentification (ex. `crackmapexec smb`,
   `hydra` sur RDP) avec une **petite** liste de mots de passe, vers `DC01` uniquement.
3. Observer côté `DC01` : `eventvwr` → Journaux Windows → Sécurité → filtrer 4625.
4. Poursuivre jusqu'au verrouillage (4740) pour valider la GPO.
5. Côté SIEM : vérifier le déclenchement des règles `100200` → `100201` (corrélation)
   et `100202` (verrouillage).

## Correspondance

| Observation | Event ID | Règle Wazuh | MITRE |
|---|---|---|---|
| Échec d'ouverture de session | 4625 | `100200` | T1110 |
| Répétition depuis une même source | 4625 × N | `100201` | T1110 |
| Compte verrouillé | 4740 | `100202` | T1110 |

Les preuves (captures d'écran, sortie `wazuh-logtest`) sont à produire — voir
[`../../captures/TODO-PREUVE_wazuh.md`](../../captures/TODO-PREUVE_wazuh.md).
