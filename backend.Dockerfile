# Étape 1 : Build du JAR avec Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app

# On copie le pom depuis le dossier parent/backend-java
COPY CICD-back/pom.xml .
RUN mvn dependency:go-offline

# On copie le dossier src depuis le dossier parent/backend-java
COPY CICD-back/src ./src
RUN mvn clean package -DskipTests

# Étape 2 : Exécution
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# On récupère le JAR généré
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]