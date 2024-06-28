FROM azul/zulu-openjdk-alpine:17-jre

COPY ./cloudcomputing/target/cloudcomputing-0.0.1-SNAPSHOT.jar ./app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app.jar"]
