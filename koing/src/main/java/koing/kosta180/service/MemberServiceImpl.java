package koing.kosta180.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import koing.kosta180.domain.MemberVO;
import koing.kosta180.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Override
	public void insertMember(MemberVO member) throws Exception {
		// 회원가입
		try {
		dao.insertMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int idCheck(String id) {
		// 회원가입 시 id 중복 체크
		int count = -1;
		try {
			if(dao.idCheck(id)==null){
				count = 0;
			}else{
				count = dao.idCheck(id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return count;
	}

	@Override
	public int loginSelect(String id, String pw) {
		// 로그인시 id와 pw 비교
		String DBpw = null;
		int check = 100;
		try {
			DBpw = dao.loginSelect(id);
			logger.info("DBpw : " + DBpw);
			if (DBpw != null) {
				// 비밀번호 비교
				if (DBpw.equals(pw)) {
					// 로그인 성공
					check = 1;
				} else {
					// 비밀번호 오류
					check = 0;
				}
			} else {
				// 아이디가 존재하지 않음
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	@Override
	public MemberVO loginMember(String id) {
		// 로그인 한 회원의 정보가지고옴
		return dao.loginMember(id);
	}

	@Override
	public void updateMember(MemberVO member) {
		// 회원정보 수정
		try {
			dao.updateMember(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
