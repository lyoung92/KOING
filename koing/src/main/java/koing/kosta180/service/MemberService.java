package koing.kosta180.service;

import koing.kosta180.domain.MemberVO;

public interface MemberService {

	//회원가입 Mapper
	public void insertMember(MemberVO member) throws Exception;

	// 회원가입 시 id 중복 확인 Mapper
	public int idCheck(String id) throws Exception;

	// 로그인시 pw와 id 비교 Mapper
	public int loginSelect(String id, String pw) throws Exception;

	// 로그인 성공 시 회원값 가져오는 Mapper
	public MemberVO loginMember(String id) throws Exception;
	
	//회원정보 수정하는 Mapper
	public void updateMember(MemberVO member) throws Exception;

}
