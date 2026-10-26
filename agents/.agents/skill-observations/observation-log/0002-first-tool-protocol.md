---
id: 2
title: "Ne pas agir avant le protocole de démarrage task-observer"
status: open
type: internal
skill: [task-observer]
proposes_skill: []
target_file: []
siblings_checked: "none — no family registry exists"
area: "Session Start Protocol"
date: 2026-10-25
session_context: "Modification de la protection de la branche main"
parked_until:
resolved:
resolution:
reference:
commands_verified: none
---

**Issue:** Une requête GitHub en lecture a été exécutée avant l’invocation du skill et l’exécution du protocole de démarrage. La règle était présente dans les instructions de session, mais aucune barrière ne l’a empêchée.

**Suggested improvement:** Ajouter une barrière pré-outil qui refuse toute commande tant que le protocole task-observer n’a pas été exécuté pour la session.

**Principle:** Une obligation de démarrage qui conditionne l’utilisation des outils doit être techniquement bloquée, pas seulement rappelée.
