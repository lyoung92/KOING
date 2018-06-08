package koing.kosta180.domain;

public class MatchingVO {
	private String mc_bno;
	private String id;
	private String mc_title;
	private String s_no;
	private String mc_contents;
	private String mc_img;
	private String mc_entryfee;
	private String mc_date;
	private String mc_time;
	private int mc_totalnum;
	private int mc_applicantnum;
	private String mc_status;
	private String s_name;
	
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
	public String getMc_title() {
		return mc_title;
	}
	public void setMc_title(String mc_title) {
		this.mc_title = mc_title;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getMc_contents() {
		return mc_contents;
	}
	public void setMc_contents(String mc_contents) {
		this.mc_contents = mc_contents;
	}
	public String getMc_img() {
		return mc_img;
	}
	public void setMc_img(String mc_img) {
		this.mc_img = mc_img;
	}
	public String getMc_entryfee() {
		return mc_entryfee;
	}
	public void setMc_entryfee(String mc_entryfee) {
		this.mc_entryfee = mc_entryfee;
	}
	public String getMc_date() {
		return mc_date;
	}
	public void setMc_date(String mc_date) {
		this.mc_date = mc_date;
	}
	public String getMc_time() {
		return mc_time;
	}
	public void setMc_time(String mc_time) {
		this.mc_time = mc_time;
	}
	public int getMc_totalnum() {
		return mc_totalnum;
	}
	public void setMc_totalnum(int mc_totalnum) {
		this.mc_totalnum = mc_totalnum;
	}
	public int getMc_applicantnum() {
		return mc_applicantnum;
	}
	public void setMc_applicantnum(int mc_applicantnum) {
		this.mc_applicantnum = mc_applicantnum;
	}
	public String getMc_status() {
		return mc_status;
	}
	public void setMc_status(String mc_status) {
		this.mc_status = mc_status;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	@Override
	public String toString() {
		return "MatchingVO [mc_bno=" + mc_bno + ", id=" + id + ", mc_title=" + mc_title + ", s_no=" + s_no
				+ ", mc_contents=" + mc_contents + ", mc_img=" + mc_img + ", mc_entryfee=" + mc_entryfee + ", mc_date="
				+ mc_date + ", mc_time=" + mc_time + ", mc_totalnum=" + mc_totalnum + ", mc_applicantnum="
				+ mc_applicantnum + ", mc_status=" + mc_status + ", s_name=" + s_name + "]";
	}
}
