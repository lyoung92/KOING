package koing.kosta180.domain;


public class ReservationVO {
	private String r_no;
	private String id;
	private String r_date;
	private String r_time;
	private String r_person;
	private String r_request;
	private String r_reqTime;
	private String r_pay;
	private String s_no;
	private String r_status;
	
	public String getR_no() {
		return r_no;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getR_time() {
		return r_time;
	}
	public void setR_time(String r_time) {
		this.r_time = r_time;
	}
	public String getR_person() {
		return r_person;
	}
	public void setR_person(String r_person) {
		this.r_person = r_person;
	}
	public String getR_request() {
		return r_request;
	}
	public void setR_request(String r_request) {
		this.r_request = r_request;
	}
	public String getR_reqTime() {
		return r_reqTime;
	}
	public void setR_reqTime(String r_reqTime) {
		this.r_reqTime = r_reqTime;
	}
	public String getR_pay() {
		return r_pay;
	}
	public void setR_pay(String r_pay) {
		this.r_pay = r_pay;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getR_status() {
		return r_status;
	}
	public void setR_status(String r_status) {
		this.r_status = r_status;
	}
	@Override
	public String toString() {
		return "ReservationVO [r_no=" + r_no + ", id=" + id + ", r_date=" + r_date + ", r_time=" + r_time
				+ ", r_person=" + r_person + ", r_request=" + r_request + ", r_reqTime=" + r_reqTime + ", r_pay="
				+ r_pay + ", s_no=" + s_no + ", r_status=" + r_status + "]";
	}
	
	
}