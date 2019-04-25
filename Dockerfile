FROM maven:3-jdk-11 as builder
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src/ /build/src
RUN mvn --batch-mode -DskipTests=true clean package

FROM openjdk:11-jdk-slim
EXPOSE 8080 8000
CMD exec java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8000,quiet=y -Djava.security.egd=file:/dev/./urandom -jar /app.jar
COPY --from=builder /build/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar /app.jar
