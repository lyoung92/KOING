package koing.kosta180.domain;

import java.sql.Timestamp;
import java.util.Date;

public class MatchingMemberVO {
	private String mc_bno;
	private String id;
	private Date mm_date;
	private Timestamp mm_time;
	private String mm_status;
	public String getMc_bno() {
		return mc_bno;
	}
	public void setMc_bno(String mc_bno) {
		this.mc_bno = mc_bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getMm_date() {
		return mm_date;
	}
	public void setMm_date(Date mm_date) {
		this.mm_date = mm_date;
	}
	public Timestamp getMm_time() {
		return mm_time;
	}
	public void setMm_time(Timestamp mm_time) {
		this.mm_time = mm_time;
	}
	public String getMm_status() {
		return mm_status;
	}
	public void setMm_status(String mm_status) {
		this.mm_status = mm_status;
	}
	@Override
	public String toString() {
		return "MatchingMemberVO [mc_bno=" + mc_bno + ", id=" + id + ", mm_date=" + mm_date + ", mm_time=" + mm_time
				+ ", mm_status=" + mm_status + "]";
	}
}