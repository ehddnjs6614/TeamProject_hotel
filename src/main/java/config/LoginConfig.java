package config;



import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import controller.LoginController;
import login.LoginDAO;

@Configuration
@EnableWebMvc
public class LoginConfig {

	@Autowired
	private DataSource dataSource;
	
	@Bean
	public LoginController loginController() {
		return new LoginController();
	}
	
	@Bean
	public LoginDAO loginDAO() {
		return new LoginDAO(dataSource);
	}
}
