# =====================
# Stage 1: Build
# =====================
FROM eclipse-temurin:17-jdk-alpine AS build

# Set workdir
WORKDIR /app

# Copy Maven wrapper and pom.xml
COPY mvnw .
COPY pom.xml .

# Download dependencies (cached)
RUN chmod +x mvnw
RUN ./mvnw dependency:go-offline -B

# Copy source code
COPY src ./src

# Build application
RUN ./mvnw clean package -DskipTests

# =====================
# Stage 2: Run
# =====================
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the jar from build stage
COPY --from=build /app/target/javagram-0.0.1-SNAPSHOT.jar app.jar

# Expose port
EXPOSE 8080

# Default command
ENTRYPOINT ["java","-jar","app.jar"]
