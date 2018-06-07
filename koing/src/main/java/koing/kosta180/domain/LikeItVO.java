package koing.kosta180.domain;

public class LikeItVO {

	private String like_no;
	private String id;
	private String s_no;
	
	
	public String getLike_no() {
		return like_no;
	}
	public void setLike_no(String like_no) {
		this.like_no = like_no;
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
	
	@Override
	public String toString() {
		return "LikeItVO [like_no=" + like_no + ", id=" + id + ", s_no=" + s_no + "]";
	}
	
	
	
}
