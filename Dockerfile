# FROM openjdk:17
# WORKDIR /app
# # COPY /var/lib/jenkins/workspace/pipeline-B/GthubActions/target/spring-app-0.0.1-SNAPSHOT.jar /app
# COPY . . 
# EXPOSE 8080
# CMD ["java", "-jar", "./target/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar"]


# Build stage
FROM maven:3.8.3-openjdk-17 AS builder
WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ src/
RUN mvn package -DskipTests

# Runtime stage
FROM gcr.io/distroless/java
WORKDIR /app

COPY --from=builder /app/target/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar .

EXPOSE 8080

CMD ["spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar"]
