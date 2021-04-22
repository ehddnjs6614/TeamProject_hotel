package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import QnABoard.BoaredCheck;
import QnABoard.QnABoardDao;
import QnABoard.QnABoardVO;

@Controller
@RequestMapping("/QnABoard")
public class QnAController {
	
	private QnABoardDao qnaBoardDao;

	@Autowired
	private QnABoardVO qnaBoardVO;
	
	//생성자
	public QnAController(QnABoardDao qnaBoardDao) {
		this.qnaBoardDao = qnaBoardDao;
	}

	//게시판 메인 이동
	@RequestMapping("/mainList")
	public String allList(Model model,HttpSession session) {

		session.setAttribute("loginId", "ehdgus5090");	//임시 세션 로그인

		List<QnABoardVO> managerList = qnaBoardDao.managerList();	//게시판 공지사항 최신 5개 가져오기
		List<QnABoardVO> allList = qnaBoardDao.AllList();	//게시판 전체 리스트 가져오기

		model.addAttribute("allList",allList);
		model.addAttribute("managerList",managerList);
		return "QnABoard/mainList";
	}
	
	
	//게시글 작성 페이지 이동
	@GetMapping("/write")
	public String writeGet() {
		return "QnABoard/write";
	}
	
	
	//본문 게시글 작성후 메인페이지로 이동
	@PostMapping("/refWrite")
	public String writePost(BoaredCheck boaredCheck , HttpServletRequest request,HttpSession session) {
		String id = (String)session.getAttribute("loginId");	//세션 id 값을 가져옴
		String title = request.getParameter("title");
		String board = request.getParameter("board");
		
		boolean check = boaredCheck.check(title,board);	//게시판에 아무것도 작성하지 않았으면 false 리턴
		//세션 id가 존재하고 check가 true라면 게시판에 글 등록
		if(id == null || id.equals("")) {	
			return "redirect:mainList";//로그인 페이지이동(미구현)
		}else if(check) {
			//게시글 작성
			qnaBoardDao.qnaInsert(id,title,board);
			return "redirect:mainList";
		}else {
			JOptionPane.showMessageDialog(null, "제목 및 내용 형식에 맞게 입력하세요");
			return "QnABoard/write";
		}
		
	}
	
	//게시글 확인 전 비밀번호 입력 페이지 이동
	@GetMapping("/pwCheck")
	public String pwCheck(HttpSession session,HttpServletRequest request,String no,Model model) {
		
		int DBno = Integer.parseInt(no);
		String loginId = (String)session.getAttribute("loginId");	//로그인 한 세션 아이디값 가져오기

		//로그인한 아이디가 없다면 로그인 페이지로 이동
		if(loginId == null || loginId.equals("")) {
			return "redirect:login/form";
		}else {
			
			int userGrade = qnaBoardDao.getUserGrade(loginId);	//해당 로그인한 아이디의 등급값을 가져옴
			String noId = qnaBoardDao.idCheck(DBno);	//게시글을 작성한 id가져옴
			
			//매니저 이상 등급이면 비밀번호 없이 확인 가능
			if(userGrade >= 3) {
				List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(DBno);	//게시글에 해당하는 내용을 가져옴
				model.addAttribute("qnaBoardVO",qnaBoardVO);					
				return "QnABoard/readForm";
			}else if(loginId.equals(noId)){
				List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(DBno);	//게시글에 해당하는 내용을 가져옴
				model.addAttribute("qnaBoardVO",qnaBoardVO);
				return "QnABoard/readForm";
			}else{
				JOptionPane.showMessageDialog(null, "본인 게시글만 확인 가능합니다.");
				return "redirect:mainList";
			}
		}
		
	}
	
	//공지 게시글 보기
	@GetMapping("/notice")
	public String pwCheck(Model model,String no) {
		
		int DBno = Integer.parseInt(no);
		
		return "redirect:notice";
		
	}
	
	//게시글 작성페이지 이동
	@PostMapping("/readForm")
	public String qna(HttpServletRequest request, HttpSession session, Model model) {
		
		String loginId = (String)session.getAttribute("loginId");	//로그인 한 세션 아이디값 가져오기
		System.out.println(request.getParameter("id"));
		
		
		//로그인한 아이디가 없다면 로그인 페이지로 이동
		if(loginId == null || loginId.equals("")) {
			return "redirect:mainList";
		}else {
			//해당 로그인한 아이디의 등급값을 가져옴
			int userGrade = qnaBoardDao.getUserGrade(loginId);
			
			//해당 아이디의 등급이 (매니저)등급 이상이면 비밀번호 확인 없이 게시글 확인 가능
			if(userGrade >= 3) {
				return "QnABoard/readForm";
			}
			
			//세션 id를 넣고 해당 db에 저장된 비밀번호 가져옴
			String dbPs = qnaBoardDao.DBpassword(request.getParameter("id"));
			
			//비밀번호가 같은지 확인
			if(request.getParameter("pw").equals(dbPs)) {
				return "QnABoard/readForm";
			}else {
				model.addAttribute("pwCheck");
				return "redirect:/pwCheck";
			}
		}
	}
	
	//게시판 수정
	@GetMapping("/writerUpdate")
	public String writerUpdate(HttpSession session ,Model model,String no) {
		
		String loginId = session.getId();
		
		if(loginId == null || loginId.equals("")) {
			return "redirect:mainList";
		}
		
		
		int DBno = Integer.parseInt(no);
		
		List<QnABoardVO> qnaBoardVO = qnaBoardDao.qnaRead(DBno);	//게시글에 해당하는 내용을 가져옴
		model.addAttribute("qnaBoardVO",qnaBoardVO);					
		
		return "QnABoard/writerUpdate";
		
	}
	
}
