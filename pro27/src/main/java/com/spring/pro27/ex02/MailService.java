package com.spring.pro27.ex02;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SimpleMailMessage preConfiguredMessage;
	
	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
			messageHelper.setCc("thdxogh3000@naver.com"); //여기로 보냄
			messageHelper.setFrom("theodore9999@naver.com", "1005호_송태호");
			//보낸사람은 이렇게써있음, 메일주소는 xml 에 보안설정과같이 입력한거랑 동일하게해야함 
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body, true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Async
	public void sendPreConfiguredMail(String message) {
		SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
		mailMessage.setText(message);
		mailSender.send(mailMessage);
	}
	
	// 인증번호 이메일 발송 메서드
	@Async
	public void sendAuthMail(String toEmail, HttpSession session) throws MessagingException {
	    // 4자리 랜덤 인증번호 생성
	    String authCode = generateAuthCode();

	    // 인증번호 이메일 발송
	    String subject = "이메일 인증번호";
	    String body = "인증번호는 " + authCode + " 입니다."; // 인증번호 내용

	    // 이메일 전송
	    sendMail(toEmail, subject, body);

	    // 세션에 인증번호 저장
	    session.setAttribute("authCode", authCode);
	    // 세션에 인증받고싶은 이메일 저장
	    session.setAttribute("notVerifiedEmail", toEmail);
	}

	private String generateAuthCode() {
        Random random = new Random();
        int authCode = 1000 + random.nextInt(9000); // 1000 ~ 9999 사이의 랜덤 숫자
        return String.valueOf(authCode);
    }

    public String verifyAuthCode(String userAuthCode, HttpSession session) {
        String sessionAuthCode = (String) session.getAttribute("authCode");
        if (sessionAuthCode != null && sessionAuthCode.equals(userAuthCode)) {
        	session.removeAttribute("authCode");
        	String email = (String) session.getAttribute("notVerifiedEmail");
        	session.removeAttribute("notVerifiedEmail");
        	session.setAttribute("verifiedEmail", email);
        	String message = "인증번호가 일치합니다. 회원가입을 진행하세요."; 
            return message;  // 인증 성공 메시지
        } else {
        	Integer failedCount = (Integer) session.getAttribute("failedCount");
        	if(failedCount == null) failedCount = 0;
        	failedCount++;
        	if(failedCount < 3) {
        		String message = "인증번호가 일치하지 않습니다. 실패횟수 : " + failedCount;
        		session.setAttribute("failedCount", failedCount);
        		return message;
        	} else {
        		String message = "인증을 세 번 실패했습니다. 새로운 인증번호를 발급해 주세요.";
        		session.removeAttribute("failedCount");
        		session.removeAttribute("notVerifiedEmail");
        		return message;
        	}
        	
            
        }
    }

    // 인증 코드 생성 및 세션 저장
    public void generateAndStoreAuthCode(HttpSession session) {
        String authCode = generateRandomAuthCode();
        session.setAttribute("authCode", authCode);
    }

    // 랜덤 인증 코드 생성
    private String generateRandomAuthCode() {
        // 예시: 6자리 랜덤 인증 코드 생성
        return String.format("%06d", new Random().nextInt(999999));
    }

	
	
}
