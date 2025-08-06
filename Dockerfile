FROM openjdk:17
WORKDIR /app
COPY . .
RUN mkdir out && javac -d out src/httpServerMain/HttpServerMain.java
RUN jar cfm server.jar manifest.txt -C out .
EXPOSE 8000
CMD ["java", "-jar", "MyServer.jar"]
