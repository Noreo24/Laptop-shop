package vn.noreo.laptopshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

// include: bao gồm
// exclude: loại bỏ
@SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
public class LaptopshopApplication {

	public static void main(String[] args) {

		ApplicationContext abc = SpringApplication.run(LaptopshopApplication.class, args);
		for (String s : abc.getBeanDefinitionNames()) {
			System.out.println(s);
		}
	}

}
