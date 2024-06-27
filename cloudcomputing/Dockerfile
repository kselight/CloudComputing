FROM azul/zulu-openjdk-alpine:17-jre

WORKDIR ./
COPY /target/cloudcomputing-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8080:80

ENTRYPOINT ["java", "-jar", "/app.jar"]