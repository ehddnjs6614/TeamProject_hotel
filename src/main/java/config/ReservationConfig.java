package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import controller.ReservationController;
import reservation.ReservationDao;

@Configuration
@EnableTransactionManagement
public class ReservationConfig {

	//db 연결 셋팅
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
		ds.setUsername("test");
		ds.setPassword("1234");
		ds.setInitialSize(10);
		ds.setMaxActive(1000);
		ds.setTestWhileIdle(true);
		ds.setMinEvictableIdleTimeMillis(60000 * 3);
		ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
		return ds;
		
	}
	
	@Bean
	//dataSource소스의 메서드를 의존받아 ReservationDao객체 생성
	public ReservationDao reservationDao(){
		return new ReservationDao(dataSource());
	}
	
	@Bean
	//ReservationController생성자 생성
	public ReservationController reservationController() {
		return new ReservationController(reservationDao());
	}
	
	
}
