FROM maven:3.9.9-eclipse-temurin-17-alpine

WORKDIR /app

COPY . .

EXPOSE 8080

CMD ["mvn","-x","spring-boot:run"]
