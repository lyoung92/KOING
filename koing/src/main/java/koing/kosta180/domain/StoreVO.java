package koing.kosta180.domain;

import java.util.Arrays;

public class StoreVO {

	private String s_no;
	private String s_name;
	private String s_address;
	private String s_tel;
	private String s_img;
	private String s_category;
	private String s_keyword;
	private String id;
	private String s_contents;
	private String s_location_no;
	private String s_files[];
	
	
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_tel() {
		return s_tel;
	}
	public void setS_tel(String s_tel) {
		this.s_tel = s_tel;
	}
	public String getS_img() {
		return s_img;
	}
	public void setS_img(String s_img) {
		this.s_img = s_img;
	}
	public String getS_category() {
		return s_category;
	}
	public void setS_category(String s_category) {
		this.s_category = s_category;
	}
	public String getS_keyword() {
		return s_keyword;
	}
	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getS_contents() {
		return s_contents;
	}
	public void setS_contents(String s_contents) {
		this.s_contents = s_contents;
	}
	public String getS_location_no() {
		return s_location_no;
	}
	public void setS_location_no(String s_location_no) {
		this.s_location_no = s_location_no;
	}
	
	public String[] getS_files() {
		return s_files;
	}
	public void setS_files(String[] s_files) {
		this.s_files = s_files;
	}
	@Override
	public String toString() {
		return "StoreVO [s_no=" + s_no + ", s_name=" + s_name + ", s_address=" + s_address + ", s_tel=" + s_tel
				+ ", s_img=" + s_img + ", s_category=" + s_category + ", s_keyword=" + s_keyword + ", id=" + id
				+ ", s_contents=" + s_contents + ", s_location_no=" + s_location_no + ", s_files="
				+ Arrays.toString(s_files) + "]";
	}
	
	
}
