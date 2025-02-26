# FROM maven:3.9.0-eclipse-temurin-17 as build
# WORKDIR /app
# COPY . .
# RUN mvn clean install

# FROM eclipse-temurin:17.0.6_10-jdk
# WORKDIR /app
# COPY --from=build /app/target/demoapp.jar /app/
# EXPOSE 8080
# CMD ["java", "-jar","demoapp.jar"]

FROM eclipse-temurin:17.0.6_10-jdk
WORKDIR /app

# Copy the pre-built JAR from Jenkins workspace
COPY target/demoapp.jar /app/

EXPOSE 8080
CMD ["java", "-jar", "demoapp.jar"]

