# Commandes Git utilisées

| Commande | Description |
|----------|-------------|
| git checkout -b develop | Crée et passe sur la branche `develop` |
| touch file1 file2 file3 | Crée 3 fichiers dans le projet |
| git add file1 file2 file3 | Prépare les fichiers pour le commit |
| git commit -m "Ajout de file1, file2 et file3 sur develop" | Enregistre les changements |
| git push origin develop| Envoie la branche `develop` sur GitHub |
| git checkout main | Passe sur la branche principale `main` |
| git merge develop | Fusionne les changements de `develop` dans `main` |
| git mv file1 file1.txt | Renomme `file1` en `file1.txt` |
| git rm file3 | Supprime le fichier `file3` |
| git commit -m "Rename file1 en file1.txt, suppression file3" | Enregistre les changements récents |
| git push origin develop | Pousse les derniers commits de `develop` sur GitHub |
| git checkout main <br> git merge develop <br> git push origin main | Met à jour la branche principale avec les derniers changements de `develop` |
