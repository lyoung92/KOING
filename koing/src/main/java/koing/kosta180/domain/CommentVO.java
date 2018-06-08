package koing.kosta180.domain;

import java.sql.Timestamp;

public class CommentVO {
	private String c_no;
	private String c_contents;
	private int c_score;
	private String c_img;
	private String r_no;
	private String id;
	private String s_no;
	private Timestamp c_date;
	private String dateToString;

	public CommentVO() {
	}

	public CommentVO(String c_no, String c_contents, int c_score, String c_img, String r_no, String id, String s_no,
			Timestamp c_date, String dateToString) {
		super();
		this.c_no = c_no;
		this.c_contents = c_contents;
		this.c_score = c_score;
		this.c_img = c_img;
		this.r_no = r_no;
		this.id = id;
		this.s_no = s_no;
		this.c_date = c_date;
		this.dateToString = dateToString;
	}



	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_contents() {
		return c_contents;
	}

	public void setC_contents(String c_contents) {
		this.c_contents = c_contents;
	}

	public int getC_score() {
		return c_score;
	}

	public void setC_score(int c_score) {
		this.c_score = c_score;
	}

	public String getC_img() {
		return c_img;
	}

	public void setC_img(String c_img) {
		this.c_img = c_img;
	}

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

	public String getS_no() {
		return s_no;
	}

	public void setS_no(String s_no) {
		this.s_no = s_no;
	}

	public Timestamp getC_date() {
		return c_date;
	}

	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}

	public String getDateToString() {
		return dateToString;
	}

	public void setDateToString(String dateToString) {
		this.dateToString = dateToString;
	}

	@Override
	public String toString() {
		return "CommentVO [c_no=" + c_no + ", c_contents=" + c_contents + ", c_score=" + c_score + ", c_img=" + c_img
				+ ", r_no=" + r_no + ", id=" + id + ", s_no=" + s_no + ", c_date=" + c_date + ", dateToString="
				+ dateToString + "]";
	}
}