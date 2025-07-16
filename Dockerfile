FROM public.ecr.aws/docker/library/ubuntu:22.04 AS builder
WORKDIR /app

# Install Java 17 and Maven
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verify installations
RUN java -version && mvn -version

COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create runtime image
FROM public.ecr.aws/docker/library/ubuntu:22.04
WORKDIR /app

# Install Java 17 runtime only
RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Verify Java installation
RUN java -version

COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8080

# Set JVM options for heap size and GC logging
ENTRYPOINT ["java", "-Xms1024m", "-Xmx3072m", "-jar", "app.jar"]
