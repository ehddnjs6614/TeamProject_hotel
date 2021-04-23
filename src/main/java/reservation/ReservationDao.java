package reservation;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class ReservationDao {
	
private JdbcTemplate jdbcTemplate;
	
	public ReservationDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//회원가입
	public void reservationInsert(ReservationVO vo) {
		String sql = "insert into ROOM values(?)";						
		this.jdbcTemplate.update(sql, 
				vo.getRoom());		//1 
	}
				
}