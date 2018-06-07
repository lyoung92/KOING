package koing.kosta180.persistence;

import koing.kosta180.domain.MemberVO;

public interface MemberDAO {
	public String getTime();
	public void insertMember(MemberVO vo);
	public String loginSelect(String id);
	public MemberVO loginMember(String id);
	public Integer idCheck(String id);
	public void updateMember(MemberVO vo);
}
