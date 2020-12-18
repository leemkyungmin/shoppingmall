package com.lkm.shoppingmall.command;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

public class uEmail_AuthCommand  {

	public String execute(SqlSession sqlSession, Model model) {
		String authKey = "";	
		String randomnum ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		try {
				
			Map<String, Object> map = model.asMap();
			JavaMailSender mailSender = (JavaMailSender)map.get("mailSender");
						
			String uEmail =(String) map.get("uEmail");
			SimpleMailMessage message = new SimpleMailMessage();
			
			message.setFrom("lkmshoppingmall@gmail.com");  // 보내는 사람의 메일 주소
			System.out.println(uEmail);
			message.setTo(uEmail); // 받는 사람의 메일 주소
			
			
				for(int i=0; i<10; i++) {
					authKey+=randomnum.charAt((int) (Math.random() * randomnum.length()));
				}
				message.setSubject("lkmShoppingmall 인증메일입니다.\n");
				message.setText((String)map.get("uSerid") + "님\n" +
						"인증 번호 : " +authKey +" 입니다.\n" );
				
				System.out.println(message);
			
						
			// mailSender 는 send() 메소드로 이메일을 보낸다.
			
			mailSender.send(message);
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		return authKey;
	}

}
