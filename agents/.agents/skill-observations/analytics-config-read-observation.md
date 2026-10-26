---
id: __ID__
title: "Éviter la lecture élargie de fichiers contenant une configuration potentiellement sensible"
status: open
type: internal
skill: [task-observer]
proposes_skill: []
target_file: ["AGENTS.md"]
siblings_checked: "none — target_file has no declared family"
area: "Respect des restrictions de lecture"
date: __DATE__
session_context: "Mise à jour de la palette visuelle du site"
parked_until:
resolved:
resolution:
reference:
commands_verified: none
---

**Issue:** Une lecture de contexte de l’implémentation a inclus une configuration d’analytique alors que la tâche ne nécessitait que la feuille de styles. Les règles du dépôt interdisent la lecture de configurations sensibles sans nécessité démontrée.

**Suggested improvement:** Avant toute lecture de code ou de configuration, limiter les fichiers ouverts au périmètre indispensable et rechercher les sélecteurs ou symboles nécessaires plutôt que lire un fichier complet par défaut.

**Principle:** La collecte de contexte doit rester minimale ; une configuration hors du périmètre fonctionnel immédiat ne doit pas être lue.
