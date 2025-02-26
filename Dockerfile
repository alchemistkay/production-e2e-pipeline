# Build stage
FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app

# Copy dependencies first to enable Docker caching
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy application source code
COPY . .
RUN mvn clean package -DskipTests

# Runtime stage (minimal JDK)
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/target/demoapp.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "demoapp.jar"]
