# Utilisation d'une image de base Java 8 (ou plus récent selon besoin)
FROM openjdk:8-jdk-alpine

# Argument pour le fichier JAR généré
ARG JAR_FILE=target/*.jar

# Copie du fichier JAR dans l'image
COPY ${JAR_FILE} app.jar

# Commande d'exécution
ENTRYPOINT ["java","-jar","/app.jar"]
