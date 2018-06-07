package koing.kosta180.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import koing.kosta180.domain.MemberVO;
import koing.kosta180.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void join(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		dao.insertMember(member);
	}

}
