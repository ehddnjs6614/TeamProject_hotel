package reservation;

import java.sql.Timestamp;

public class ReservationVO { 
	private String ruserName;
	private String ruserPhone;
	private int ruserCount;
	private Timestamp checkIn;
	private Timestamp checkOut;	
	private String roomType;
	private int ruserPrice;
	
	public ReservationVO(String ruserName, String ruserPhone, int ruserCount, Timestamp checkIn, 
			Timestamp checkOut, String roomType, int ruserPrice) {
		this.ruserName = ruserName;
		this.ruserPhone = ruserPhone;
		this.ruserCount = ruserCount;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.roomType = roomType;
		this.ruserPrice = ruserPrice;
	}

	public String getRuserName() {
		return ruserName;
	}

	public void setRuserName(String ruserName) {
		this.ruserName = ruserName;
	}

	public String getRuserPhone() {
		return ruserPhone;
	}

	public void setRuserPhone(String ruserPhone) {
		this.ruserPhone = ruserPhone;
	}

	public int getRuserCount() {
		return ruserCount;
	}

	public void setRuserCount(int ruserCount) {
		this.ruserCount = ruserCount;
	}

	public Timestamp getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Timestamp checkIn) {
		this.checkIn = checkIn;
	}

	public Timestamp getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Timestamp checkOut) {
		this.checkOut = checkOut;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getRuserPrice() {
		return ruserPrice;
	}

	public void setRuserPrice(int ruserPrice) {
		this.ruserPrice = ruserPrice;
	}
	
}
 