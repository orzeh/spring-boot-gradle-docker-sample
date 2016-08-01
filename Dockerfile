FROM azul/zulu-openjdk-debian:8
MAINTAINER orzeh

ENTRYPOINT java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -cp /app/ org.springframework.boot.loader.JarLauncher

# add Spring Boot launcher classes
COPY ./build/docker/org/ /app/org/
# add Logback configuration
COPY ./build/docker/BOOT-INF/classes/logback.xml /app/BOOT-INF/classes/
# runtime libraries
COPY ./build/docker/BOOT-INF/lib/ /app/BOOT-INF/lib/
# application configuration
COPY ./build/docker/BOOT-INF/classes/application.properties /app/BOOT-INF/classes/
# Spring Boot banner (updated when version changes)
COPY ./build/docker/BOOT-INF/classes/banner.txt /app/BOOT-INF/classes/
# application classes
COPY ./build/docker/BOOT-INF/classes/com/example /app/BOOT-INF/classes/com/example
# manifest file always recreated by Spring Boot 
COPY ./build/docker/META-INF /app/META-INF/
