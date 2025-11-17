# Stage 1: Build
FROM openjdk:17 AS builder
WORKDIR /app
COPY app/HelloWorld.java .
RUN javac HelloWorld.java

# Stage 2: Runtime
FROM openjdk:17-slim
WORKDIR /app
COPY --from=builder /app/HelloWorld.class .
CMD ["java", "HelloWorld"]
