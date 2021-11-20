FROM maven:3.5.2-jdk-8-alpine AS builder
MAINTAINER Hau Nguyen
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn package
# Intergration
FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=builder /build/target/app.jar /app/
ENTRYPOINT ["java", "-jar", "app.jar"]
