# Stage 1: Build the application
FROM maven:3.9.6-eclipse-temurin-21 as build
WORKDIR /app

# Copy all project files to container
COPY . .

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/dsa-website.jar dsa-website.jar

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "dsa-website.jar"]
