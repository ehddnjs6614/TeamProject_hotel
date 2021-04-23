
package controller;
  
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import reservation.ReservationDao;
  
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
  
}
 