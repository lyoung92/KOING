package koing.kosta180.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import koing.kosta180.domain.LikeItVO;
import koing.kosta180.persistence.LikeItDAO;

public class LikeItServiceImpl implements LikeItService {

	
	@Inject
	private LikeItDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(LikeItServiceImpl.class);
	
	@Override
	public void insertLikeIt(LikeItVO likeIt) throws Exception {
		// TODO Auto-generated method stub
		dao.insertLikeIt(likeIt);
	}

}












