# Use Maven image to build the project
FROM maven:latest AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Use a lightweight JDK image to run the app
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/untitled-1.0-SNAPSHOT.jar app.jar

CMD ["java", "-jar", "app.jar"]
