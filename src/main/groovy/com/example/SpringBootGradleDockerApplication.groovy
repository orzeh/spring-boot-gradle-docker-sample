package com.example

import groovy.util.logging.Slf4j 
import org.springframework.boot.SpringApplication
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.CommandLineRunner
import org.springframework.beans.factory.annotation.Value

@Slf4j
@SpringBootApplication
class SpringBootGradleDockerApplication implements CommandLineRunner {

	@Value('${name}')
	String name

	static void main(String[] args) {
		SpringApplication.run SpringBootGradleDockerApplication, args
	}

	@Override
	void run(String... args) {
		log.info("Hello $name!")
	}
}
