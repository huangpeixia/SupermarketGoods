package com.supermarketgoods;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.supermarketgoods.dao")
public class JxcApplication {

	public static void main(String[] args) {

		SpringApplication.run(JxcApplication.class, args);
	}

}
