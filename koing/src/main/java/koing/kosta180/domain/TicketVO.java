package koing.kosta180.domain;

public class TicketVO {
	private String t_bno;
	private String t_contents;
	private String s_no;
	private int t_cost;
	private int t_discount;
	private int t_fixedprice;
	private int t_effectivelife;
	private String i_no;
	private int i_valid;
	private String com_contents;
	
	private String id;
	
	public String getT_bno() {
		return t_bno;
	}
	public void setT_bno(String t_bno) {
		this.t_bno = t_bno;
	}
	public String getT_contents() {
		return t_contents;
	}
	public void setT_contents(String t_contents) {
		this.t_contents = t_contents;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public int getT_cost() {
		return t_cost;
	}
	public void setT_cost(int t_cost) {
		this.t_cost = t_cost;
	}
	public int getT_discount() {
		return t_discount;
	}
	public void setT_discount(int t_discount) {
		this.t_discount = t_discount;
	}
	public int getT_fixedprice() {
		return t_fixedprice;
	}
	public void setT_fixedprice(int t_fixedprice) {
		this.t_fixedprice = t_fixedprice;
	}
	public int getT_effectivelife() {
		return t_effectivelife;
	}
	public void setT_effectivelife(int t_effectivelife) {
		this.t_effectivelife = t_effectivelife;
	}
	public String getI_no() {
		return i_no;
	}
	public void setI_no(String i_no) {
		this.i_no = i_no;
	}
	public int getI_valid() {
		return i_valid;
	}
	public void setI_valid(int i_valid) {
		this.i_valid = i_valid;
	}
	public String getCom_contents() {
		return com_contents;
	}
	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "TicketVO [t_bno=" + t_bno + ", t_contents=" + t_contents + ", s_no=" + s_no + ", t_cost=" + t_cost
				+ ", t_discount=" + t_discount + ", t_fixedprice=" + t_fixedprice + ", t_effectivelife="
				+ t_effectivelife + ", i_no=" + i_no + ", i_valid=" + i_valid + ", com_contents=" + com_contents + "]";
	}
}

