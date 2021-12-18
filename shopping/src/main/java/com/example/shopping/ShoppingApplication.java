package com.example.shopping;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;



@MapperScan(basePackageClasses = ShoppingApplication.class)
@SpringBootApplication
public class ShoppingApplication {

	public static void main(String[] args) {
		SpringApplication.run(ShoppingApplication.class, args);
	}
	
	@Bean
    public InternalResourceViewResolver setupViewResolver() {
    
           InternalResourceViewResolver resolver = new InternalResourceViewResolver();
    
           resolver.setPrefix("/WEB-INF/views/");
           resolver.setSuffix(".jsp");
           return resolver;
    }


}
