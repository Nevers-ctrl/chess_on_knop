FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY ChessServer.java .
RUN javac -encoding UTF-8 ChessServer.java

# UTF-8 в логах и в ответах (в контейнере по умолчанию кодировка не UTF-8)
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
# порт внутри контейнера - его же указывайте в Railway -> Networking -> TCP Proxy
ENV PORT=8080
EXPOSE 8080

CMD ["java", "-Dfile.encoding=UTF-8", "-Dstdout.encoding=UTF-8", "-XX:+UseSerialGC", "-Xmx256m", "ChessServer"]
