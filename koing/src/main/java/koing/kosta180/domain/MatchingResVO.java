package koing.kosta180.domain;

public class MatchingResVO {
	private String mc_bno;
	private String mr_status;
	
	public String getMc_bno() {
		return mc_bno;
	}
	public void setMc_bno(String mc_bno) {
		this.mc_bno = mc_bno;
	}
	public String getMr_status() {
		return mr_status;
	}
	public void setMr_status(String mr_status) {
		this.mr_status = mr_status;
	}
	
	@Override
	public String toString() {
		return "MatchingResVO [mc_bno=" + mc_bno + ", mr_status=" + mr_status + "]";
	}
}
