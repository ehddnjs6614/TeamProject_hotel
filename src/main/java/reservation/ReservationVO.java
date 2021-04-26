package reservation;
  
public class ReservationVO { 
	private String ruserName;
	private String ruserPhone;
	private int ruserCount;
	private String ruserDate;
	private String ruserRoom;
	private int ruserPrice;
	
	public ReservationVO(String ruserName, String ruserPhone, int ruserCount, String ruserDate, String ruserRoom, int ruserPrice) {
		this.ruserName = ruserName;
		this.ruserPhone = ruserPhone;
		this.ruserCount = ruserCount;
		this.ruserDate = ruserDate;
		this.ruserRoom = ruserRoom;
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

	public String getRuserDate() {
		return ruserDate;
	}

	public void setRuserDate(String ruserDate) {
		this.ruserDate = ruserDate;
	}

	public String getRuserRoom() {
		return ruserRoom;
	}

	public void setRuserRoom(String ruserRoom) {
		this.ruserRoom = ruserRoom;
	}

	public int getRuserPrice() {
		return ruserPrice;
	}

	public void setRuserPrice(int ruserPrice) {
		this.ruserPrice = ruserPrice;
	}
	
}
 