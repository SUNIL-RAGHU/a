package com.sunil.Kaiburr.Kaiburr;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;


@SpringBootApplication
@EnableMongoRepositories


public class KaiburrApplication {

	public static void main(String[] args) {
		SpringApplication.run(KaiburrApplication.class, args);
	}

}
