# Etape 1 - Choix du backend

Pour cette étape, nous conservons le backend par défaut (local) car :
- L'infrastructure est gérée pour un usage local/individuel (un seul opérateur, pas de travail collaboratif sur le state)
- Le fichier terraform.tfstate local est suffisant tant qu'il n'y a pas de risque de conflit d'accès concurrent
- Un backend distant (S3, Consul, etc.) ajouterait une dépendance externe et une complexité non justifiée à ce stade du projet

Si l'infrastructure devait être gérée par plusieurs développeurs ou administrée depuis plusieurs postes, 
un backend distant deviendrait nécessaire pour centraliser et verrouiller le state (state locking), 
évitant ainsi des écrasements concurrents ou des incohérences entre les états locaux de chaque utilisateur.