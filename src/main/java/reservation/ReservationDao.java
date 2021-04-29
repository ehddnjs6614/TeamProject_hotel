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
		
		if(duplicatedCheck(vo)==false) {
		String sql = "insert into RESERVATION values(?,?,?,?,?,?,?)";						
		this.jdbcTemplate.update(sql, 
				vo.getRuserName(),
				vo.getRuserPhone(),
				vo.getRuserCount(),
				vo.getCheckIn(),
				vo.getCheckOut(),
				vo.getRoomType(),
				vo.getRuserPrice());
		
		}
	}
	
	/**
	 * 예약기간 중복 체크, query로 검색
	 */
	public boolean duplicatedCheck(ReservationVO vo) {
		String sql =
				"SELECT count(*) " +
				"FROM RESERVATION " +
				"WHERE CHECKIN <=  '" + vo.getCheckOut() + "' AND CHECKOUT >= '" + vo.getCheckIn() +"'";
		
		int count = this.jdbcTemplate.queryForObject(sql, Integer.class);
	
		return count > 0;
	}
	
}