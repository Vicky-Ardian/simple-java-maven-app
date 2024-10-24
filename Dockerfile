FROM maven:3.8.6-openjdk-11 AS builder

WORKDIR /app

COPY *.xml .
COPY src ./src

RUN mvn -B -DskipTests clean package


FROM openjdk:11-jre

WORKDIR /app

COPY --from=builder /app/target/*.jar .

ENTRYPOINT ["java", "-jar", "my-app.jar"]
