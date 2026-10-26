---
id: 1
title: "Éviter la lecture élargie de fichiers contenant une configuration potentiellement sensible"
status: open
type: internal
skill: [task-observer]
proposes_skill: []
target_file: ["AGENTS.md"]
siblings_checked: "none — target_file has no declared family"
area: "Respect des restrictions de lecture"
date: 2026-10-25
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


### Instance — 2026-10-25

Lors de la suppression de la fonctionnalité Archives, la lecture de `src/mazama_blog/site.gleam` a dépassé la zone nécessaire et a exposé une configuration analytique. La correction proposée reste applicable : cibler les plages de lignes contenant uniquement les routes, les vues et la navigation, sans lire les éléments de configuration non pertinents.
