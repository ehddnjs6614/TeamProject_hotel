
package controller;
  
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import reservation.ReservationDao;
import reservation.ReservationVO;
  
@Controller
@RequestMapping("/reservation") 
public class ReservationController {
  
  private ReservationDao reservationDao;
  
  //Dao 메서드를 사용
  public ReservationController(ReservationDao reservationDao) {
	  this.reservationDao = reservationDao;
	}
  
  //예약홈페이지  
  @RequestMapping("/reservation") 
  public String reservation() { 
	  return "reservation/reservation"; 
  } 
  
  @RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response){
		String ruserName = request.getParameter("ruserName");
		
		String ruserPhone = request.getParameter("ruserPhone");
		
		int ruserCount = Integer.parseInt(request.getParameter("ruserCount"));
		
		Date checkIn = Date.valueOf(request.getParameter("checkIn"));
		Date checkOut = Date.valueOf(request.getParameter("checkOut"));
		
		String  roomType = request.getParameter("roomType"); 
		
		int ruserPrice = Integer.parseInt(request.getParameter("ruserPrice"));
						
		ReservationVO vo = new ReservationVO(ruserName, ruserPhone, ruserCount, checkIn, checkOut, roomType, ruserPrice);
		
		//예약기간 중복체크
		if(reservationDao.duplicatedCheck(vo)) {
			response.setContentType("text/html; charset=utf-8");
			try {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 예약이 된 기간입니다.'); history.go(-1);</script>");
			out.flush();
			}catch (IOException e) {
				e.printStackTrace();
			}
		}
		 
		
		reservationDao.reservationInsert(vo);
		return "reservation/test";
		
	}
  
}
 