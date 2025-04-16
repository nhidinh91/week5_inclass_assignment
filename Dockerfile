# === Build Stage ===
FROM maven:3.9.4-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

# === Run Stage ===
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/untitled-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]