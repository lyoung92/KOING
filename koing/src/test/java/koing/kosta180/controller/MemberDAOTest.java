package koing.kosta180.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import koing.kosta180.domain.LocationStoreVO;
import koing.kosta180.domain.MemberVO;
import koing.kosta180.persistence.MemberDAO;
import koing.kosta180.persistence.RecommendDAO;
import koing.kosta180.persistence.StoreDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class MemberDAOTest {

	@Inject
	private RecommendDAO dao;
	
	@Test
	public void testTime() throws Exception{
		System.out.println(dao.getTime());
	}
	
	@Test
	public void mostLikeStoreList(){
		dao.mostLikeStoreList();
	}
	
	/*@Test
	public void listStore(){
		LocationStoreVO locationStoreVO = new LocationStoreVO();
				
		locationStoreVO.setSeoulList(dao.locationStoreList("02"));					// 서울 지역번호 02를 가지고 서울의 상점을 리스트에 담음
		locationStoreVO.setIncheonList(dao.locationStoreList("032"));			// 인천 지역번호 032를 가지고 인천의 상점을 리스트에 담음
		locationStoreVO.setGyeonggiList(dao.locationStoreList("031"));        // 경기 지역번호 031을 가지고 경기의 상점을 리스트에 담음
		System.out.println(locationStoreVO.getSeoulList().get(0));
	}*/
	
	/*@Test
	public void testInsertMember()throws Exception{
		MemberVO vo = new MemberVO();
		vo.setId("test9");
		vo.setPw("999999");
		vo.setM_name("test9이름");
		vo.setM_gender("M");
		vo.setM_ssno(999999);
		vo.setM_pno("01041075713");
		vo.setM_address("경기도 부천시");
		vo.setM_agree(true);
		vo.setM_grade("일반회원");
		vo.setM_storeId("A01,A02,A03,A04,A05");
		
		dao.insertMember(vo);
	}*/
}
