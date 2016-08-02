# Introduction
Sample project demonstrating how to build Docker image for [Spring Boot](http://projects.spring.io/spring-boot/) application using [gradle-docker-plugin](https://github.com/bmuschko/gradle-docker-plugin).

## Building
To build Docker image containing sample Spring Boot application run following command in terminal:
````bash
./gradlew buildDockerImage
````

## Running
To run built image run:
````bash
docker run --rm -it orzeh/spring-boot-gradle-docker:0.0.1-SNAPSHOT
````

# Details
This sample project utilizes several optimizations in order to use [Docker cache](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#/build-cache) as much as possible. Main idea is based on @bsideup blog post: http://bsideup.blogspot.in/2015/04/spring-boots-fat-jars-vs-docker.html

## Unpack Fat JAR
In `build.gradle` there is a task named `unpackFatJar` which is responsible for unpacking contents of Spring Boot Fat Jar into build dir subdirectory. This task preserves modification dates of all copied files (Gradle [won`t do this out of the box](https://issues.gradle.org/browse/GRADLE-2698))  

## Dockerfile
`Dockerfile` contains several `COPY` instructions ordered in such a way that files that changes more frequently are _at the bottom_. This ensures utilizing Docker cache.

## .dockerignore
`.dockerignore` file excludes files not used during image build. It reduces the amount of data that need to be send over wire when working with remote Docker engine.
