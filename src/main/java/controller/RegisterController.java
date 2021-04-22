package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import register.RegisterDao;
import register.RegisterVO;

@Controller
@RequestMapping("/register")
public class RegisterController {
	
	private RegisterDao registerDao;
	
	//Dao 메서드를 사용
	public RegisterController(RegisterDao registerDao) {
		this.registerDao = registerDao;
	}
	//약관동의
	@RequestMapping("/registerAgree")
	public String registerAgree() {		
		return "register/registerAgree";	
	}
	
	//개인회원가입 페이지
	@RequestMapping("/register")
	public String register() {		
		return "register/register";	
	}
		
	/**
	 * 
	 * @author CHOCO
	 * @param request : 회원 가입 페이지로부터 받아온 정보
	 * @return
	 */
	@RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response){
		String userId = request.getParameter("userId");
		String userPassword = request.getParameter("userPassword");
		String userName = request.getParameter("userName");
		System.out.println(userName);
		String userBirth = request.getParameter("userBirth");
		System.out.println(userBirth);
		String userPhone = request.getParameter("userPhone");
		System.out.println(userPhone);
		String userEmail = request.getParameter("userEmail");
		System.out.println(userEmail);
		String userAddress = request.getParameter("userAddress");
		System.out.println(userAddress);
		Timestamp userRegdate = new Timestamp(System.currentTimeMillis());
		System.out.println(userRegdate);
			
		int userGrade = Integer.parseInt(request.getParameter("userGrade"));
		RegisterVO vo = new RegisterVO(userId, userPassword, userName, userBirth, userPhone, userEmail, userAddress, userRegdate, userGrade);
		
		//아이디 중복체크
		if(registerDao.duplicatedCheck(vo)) {
			response.setContentType("text/html; charset=utf-8");
			try {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디를 이미 사용중입니다.'); history.go(-1);</script>");
			out.flush();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		registerDao.userInsert(vo);
		return "register/test";
		
	}	
	
	
}
