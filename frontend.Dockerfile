FROM node:18-alpine
WORKDIR /app

# Correction ici : on utilise uniquement le nouveau nom CICD-front
COPY CICD-front/package.json CICD-front/package-lock.json ./
RUN npm install

COPY CICD-front/ .

EXPOSE 3000
CMD ["npm", "start"]