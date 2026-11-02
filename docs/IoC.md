# Indicateurs et correspondance MITRE ATT&CK

## Détection

| Scénario | Technique MITRE | Source | Règle Wazuh |
|---|---|---|---|
| Brute force RDP/SMB | [T1110](https://attack.mitre.org/techniques/T1110/) | Windows Security (4625) | `100200`, `100201` |
| Verrouillage de compte (conséquence) | T1110 | Windows Security (4740) | `100202` |
| Kerberoasting (*non réalisé*) | [T1558.003](https://attack.mitre.org/techniques/T1558/003/) | Windows Security (4769, chiffrement RC4) | — (à ajouter seulement si rejoué) |

## Indicateurs observables

- Rafale d'**Event ID 4625** (échec d'ouverture de session) pour un même compte/source.
- **Event ID 4740** : compte verrouillé après atteinte du seuil (GPO `Pol-Verrouillage`).
- Source des tentatives = IP de `attacker` (Kali) sur le réseau du lab.

> Les captures et sorties réelles sont à produire dans la VM (voir `captures/`).
> La ligne Kerberoasting reste une **note** tant que le scénario n'est pas effectivement
> réalisé et prouvé : ne rien inventer.
