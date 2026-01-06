FROM node:18-alpine
WORKDIR /app

# CORRECTION : On est DANS metier-front.
# On ne met PAS 'CICD-front/' ni 'metier-front/'
COPY package.json package-lock.json ./
RUN npm install

# On copie tout le contenu courant (src, public, etc.)
COPY . .

EXPOSE 3000
CMD ["npm", "start"]