package koing.kosta180.service;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import koing.kosta180.domain.CategoryScoreVO;
import koing.kosta180.domain.MatchingMemberVO;
import koing.kosta180.domain.MatchingResVO;
import koing.kosta180.domain.MatchingVO;
import koing.kosta180.domain.StoreVO;
import koing.kosta180.persistence.MatchingDAO;

@Service
public class MatchingServiceImpl implements MatchingService {

	@Inject
	private MatchingDAO dao;

	@Override
	public void insertMatching(MatchingVO vo, String s_no) throws Exception {
		vo.setS_name(dao.getStoreName(s_no));
		System.out.println(s_no);
		System.out.println(vo.getS_name());
		dao.insertMatching(vo);
	}

	@Override
	public MatchingVO readMatching(String mc_bno) throws Exception {
		return dao.readMatching(mc_bno);
	}

	@Override
	public void updateMatching(MatchingVO vo) throws Exception {
		dao.updateMatching(vo);
	}

	@Override
	public void deleteMatching(String mc_bno) throws Exception {
		dao.deleteMatching(mc_bno);
	}

	@Override
	public List<MatchingVO> listAllMatching() throws Exception {
		return dao.listAllMatching();
	}

	@Override
	public List<MatchingVO> listMatching() throws Exception {
		return dao.listMatching();
	}

	@Override
	public List<MatchingVO> listMyMatching(String id) throws Exception {
		return dao.listMyMatching(id);
	}

	@Override
	public void applyMatching(MatchingMemberVO mm) throws Exception {
		dao.applyMatching(mm);
	}

	@Override
	public void cancelMatching(String mc_bno) throws Exception {
		dao.cancelMatching(mc_bno);
	}

	@Override
	public void countPlus(String mc_bno) throws Exception {
		dao.countPlus(mc_bno);
	}

	@Override
	public void countMinus(String mc_bno) throws Exception {
		dao.countMinus(mc_bno);
	}

	@Override
	public void reserveMatching(String mc_bno) throws Exception {
		dao.reserveMatching(mc_bno);
	}

	@Override
	public MatchingResVO reserveinfo(String mc_bno) throws Exception {
		return dao.reserveinfo(mc_bno);
	}

	@Override
	public void cancelResMatching(String mc_bno) throws Exception {
		dao.cancelResMatching(mc_bno);
	}

	@Override
	public void acceptRes(String mc_bno) throws Exception {
		dao.acceptRes(mc_bno);
	}

	@Override
	public void rejectRes(String mc_bno) throws Exception {
		dao.rejectRes(mc_bno);
	}

	@Override
	public void sendMail(String m_email) throws Exception {

		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail�� ������ true ����
		p.put("mail.smtp.host", "smtp.gmail.com"); // smtp ���� �ּ�
		p.put("mail.smtp.auth", "true"); // gmail�� ������ true ����
		p.put("mail.smtp.port", "587"); // gmail ��Ʈ

		Authenticator auth = new MyAuthentication();

		// session ���� �� MimeMessage����
		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			// ���������ð�
			msg.setSentDate(new Date());

			InternetAddress from = new InternetAddress();

			from = new InternetAddress("koingmatching<koingmatching@gmail.com>");

			// �̸��� �߽���
			msg.setFrom(from);

			// �̸��� ������
			InternetAddress to = new InternetAddress(m_email);
			msg.setRecipient(Message.RecipientType.TO, to);

			// �̸��� ����
			msg.setSubject("신청하신 매칭이 완료되었습니다.", "UTF-8");

			// �̸��� ����
			msg.setText("마이페이지에서 매칭을 확인해주세요", "UTF-8");

			// �̸��� ���
			msg.setHeader("content-Type", "text/html");

			// ���Ϻ�����
			javax.mail.Transport.send(msg);

		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		}
		
	}

	@Override
	public String getMail(String id) throws Exception {
		return dao.getMail(id);
	}

	@Override
	public List<CategoryScoreVO> getMemberCategory(String id) throws Exception {
		return dao.getMemberCategory(id);
	}

	@Override
	public List<CategoryScoreVO> getMcCategory(String s_no) throws Exception {
		return dao.getMcCategory(s_no);
	}

	@Override
	public List categorysno() throws Exception {
		return dao.categorysno();
	}

	@Override
	public List<MatchingVO> listCateMatching(String s_no) throws Exception {
		return dao.listCateMatching(s_no);
	}

	@Override
	public String getId(String mc_bno) throws Exception {
		return dao.getId(mc_bno);
	}

	@Override
	public MatchingVO Matchinginfo(String mc_bno) throws Exception {
		return dao.Matchinginfo(mc_bno);
	}

	@Override
	public List<StoreVO> allStoreList() throws Exception {
		// TODO Auto-generated method stub
		return dao.allStoreList();
	}

	
	
	
}