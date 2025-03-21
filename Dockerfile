# Use the latest OpenJDK 21 image with a slim build
FROM openjdk:21-jdk-slim

# Set environment variables for the application
ENV APP_HOME=/app
WORKDIR $APP_HOME

# Copy the JAR file to the container
COPY target/dsa-website-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 (default for Spring Boot)
EXPOSE 8080

# Run the application with optimized JVM options
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]
