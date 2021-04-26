package reservation;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class ReservationDao {
	
private JdbcTemplate jdbcTemplate;
	
	public ReservationDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//로그인정보가져오기
	
	//예약하기
	public void reservationInsert(ReservationVO vo) {
		String sql = "insert into RESERVATION values(?)";						
		this.jdbcTemplate.update(sql, 
				vo.getRuserName(),
				vo.getRuserPhone(),
				vo.getRuserCount(),
				vo.getRuserDate(),
				vo.getRuserRoom(),
				vo.getRuserPhone());
	}
				
}