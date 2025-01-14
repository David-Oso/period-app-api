#
# Build stage
#
FROM maven:3.8.2-openjdk-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests

#
# Package stage
#
FROM openjdk:17-jdk
COPY --from=build /target/period-app-0.0.1-SNAPSHOT.jar demo.jar
# ENV PORT=8080
EXPOSE 8890
ENTRYPOINT ["java","-jar","demo.jar"]
