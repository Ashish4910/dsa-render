# Use Maven with JDK 21 to build the application
FROM maven:3.9.4-eclipse-temurin-21 as build
COPY . .
RUN mvn clean package -DskipTests

# Use OpenJDK 21 for running the application
FROM eclipse-temurin:21-jdk
COPY --from=build /target/dsa-multilang-website-0.0.1-SNAPSHOT.jar dsa-multilang-website.jar
EXPOSE 8080
<<<<<<< HEAD
ENTRYPOINT ["java", "-jar", "dsa-multilang-website.jar"]
=======
ENTRYPOINT ["java", "-jar", "dsa-multilang-website.jar"]
>>>>>>> 1d365dddc52298c06e8e6c707ca1c14c326d68fd
