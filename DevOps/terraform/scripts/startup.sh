#!/usr/bin/env bash

# Mise à jour du système
apt-get update -y

# Installation d'un serveur web simple (Apache)
apt-get install -y apache2

# Activation du service
systemctl enable apache2
systemctl start apache2

# Page d'accueil simple
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Terraform GCP Demo</title>
</head>
<body>
  <h1>Instance déployée via Terraform</h1>
  <p>Backend derrière un HTTP Load Balancer GCP.</p>
</body>
</html>
EOF
