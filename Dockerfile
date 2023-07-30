FROM openjdk:17
WORKDIR /app
# COPY /var/lib/jenkins/workspace/pipeline-B/GthubActions/target/spring-app-0.0.1-SNAPSHOT.jar /app
COPY . . 
EXPOSE 8080
# CMD ["java", "-jar", "spring-app-0.0.1-SNAPSHOT.jar"] 
CMD ["java", "-jar", "./target/spring-boot-hello-world-example-0.0.1-SNAPSHOT.jar"]
