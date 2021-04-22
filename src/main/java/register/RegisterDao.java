package register;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class RegisterDao {
	
private JdbcTemplate jdbcTemplate;
	
	public RegisterDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//회원가입
	public void userInsert(RegisterVO vo) {
		String sql = "insert into REGISTER_USER values(register_user_seq.nextval,?,?,?,?,?,?,?,?,?)";						
		this.jdbcTemplate.update(sql, 
				vo.getUserId(),		//1 
				vo.getUserPassword(),	//2
				vo.getUserName(),		//3
				vo.getUserBirth(),		//4
				vo.getUserPhone(),		//5
				vo.getUserEmail(),		//6
				vo.getUserAddress(),	//7
				vo.getUserRegdate(),	//8
				vo.getUserGrade());		//9
	}
	
	/**
	 * 중복 사용자 체크, query로 검색
	 */
	public boolean duplicatedCheck(RegisterVO vo) {
		String sql = "SELECT count(*) FROM REGISTER_USER WHERE USERID = '" + vo.getUserId() + "'";
		int count = this.jdbcTemplate.queryForObject(sql, Integer.class);
		
		return count > 0;
	}
}
