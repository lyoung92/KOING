package koing.kosta180.service;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthentication extends Authenticator {
	PasswordAuthentication pa;
	
    public MyAuthentication(){
    	
    	String id = "koingmatching@gmail.com";		// ���� ID
    	String pw = "koingmatching1234";			// ���� ��й�ȣ

        // ID�� ��й�ȣ�� �Է��Ѵ�.
    	pa = new PasswordAuthentication(id, pw);
     
    }

    // �ý��ۿ��� ����ϴ� ��������
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}
