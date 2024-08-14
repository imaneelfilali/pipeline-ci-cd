# Utiliser l'image officielle de Node.js comme image de base
FROM node:20

# Créer et définir le répertoire de travail
WORKDIR /app

# Copier package.json et package-lock.json dans le répertoire de travail
COPY package.json package-lock.json ./
RUN sleep 600
# Installer les dépendances
RUN npm install

# Copier le reste des fichiers de l'application dans le répertoire de travail
COPY . .

# Exposer le port sur lequel l'application s'exécute
EXPOSE 3000

# Démarrer l'application
CMD ["npm", "start"]
