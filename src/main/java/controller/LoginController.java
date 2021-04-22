package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import login.LoginDAO;
import login.LoginVO;
import register.RegisterVO;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginDAO loginDAO;
	
	LoginVO vo = new LoginVO();

	@RequestMapping("/view")
	public String view(Model model) {

		return "login/loginView";
	}

	@GetMapping("/form")
	public String test() {
		return "login/loginView";
	}

	@PostMapping("/submit")
	public String submit(HttpSession session, HttpServletRequest request) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 로그인한 아이디와 비밀번호 정보를 가져온다.
		String id = request.getParameter("id");
		String pw = request.getParameter("password");

		System.out.println(id);
		System.out.println(pw);

		// LoginDAO의 selectUser 쿼리문 results 값 불러옴
		RegisterVO results = loginDAO.selectUser(id);

//		session = request.getSession(true);
//		session.setAttribute("id", "1234");
//		session.setAttribute("password", "1234");

		// 유저 유무확인
		if (results == null) {
			System.out.println("no id");
			return "login/loginView";

		} else { // 로그인 성공
			if (!pw.equals(results.getUserPassword())) { // 비밀번호 일치 여부확인
				System.out.println("password wrong");
				return "login/loginView";
			}
			System.out.println("pass");
			return "register/test";
		}

//		if(a == null) {
//			return "login/loginView";
//		}else if(!b.equals(loginVO.getUserPassword())) {
//			return "login/loginView";
//		}else

	}

	// 1 컨틀롤러 메서드 하나 더 구현
	// 2 메서드는 아이디 패스워드가 맞는지 확인하여 데이터를 받아옴
	// if문 사용하서 받아온 값이 treu이면 로그인(세션에 데이터를 입력 시키고 loginId) 메인 홈페이지로 이동
	// false면 경고창 내서 틀렷다고 하고 현재페이지를 다시 보여줌

	// login 파라미터로 id pw를 받아와서 id에 해당하는 데이터가 db에 있는지 확인하고
	// 그 db에 있는 아이디에대한 pw를 가져와서 입력한 패스워드랑 비교후 맞으면 true 틀리면 false 리턴

}
