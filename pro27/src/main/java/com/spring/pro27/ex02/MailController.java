package com.spring.pro27.ex02;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@EnableAsync
public class MailController {
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
	public void sendSimpleMail(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		rq.setCharacterEncoding("utf-8");
		rs.setContentType("text/html;charset=utf-8");
		PrintWriter out = rs.getWriter();
		mailService.sendMail("thdxogh3000@naver.com", "테스트메일", "테스트메일임");
		mailService.sendPreConfiguredMail("테스트 메일이에용");
		out.print("메일을 보냈음");
	}
	
	@RequestMapping(value = "/sendMail2.do", method = RequestMethod.GET)
	public void sendSalesMail(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		rq.setCharacterEncoding("utf-8");
		rs.setContentType("text/html;charset=utf-8");
		PrintWriter out = rs.getWriter();
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
		sb.append("<h1>판촉메일(송태호)</h1>");
		sb.append("아이스크림 판촉 메일입니다<br><br>");
		sb.append("<a href='https://www.bing.co.kr/product/detail?PDT=6'>");
		sb.append("<img src='https://pbs.twimg.com/media/Ge1gPMSbEAEk99A?format=jpg&name=900x900'></a><br>");
		sb.append("<h2><a href='https://www.bing.co.kr/product/detail?PDT=6'>상품보기</a></h2>");
		sb.append("</body></html>");
		String str=sb.toString();
		mailService.sendMail("thdxogh3000@naver.com", "판촉메일(송태호)", str);		
		out.print("메일을 보냈음");
	}
		
	@RequestMapping(value = "/sendAuthCode.do", method = RequestMethod.POST)
	public void sendAuthCode(HttpServletRequest rq, HttpServletResponse rs, HttpSession session) throws Exception {
	    rq.setCharacterEncoding("utf-8");
	    rs.setContentType("text/html;charset=utf-8");
	    PrintWriter out = rs.getWriter();
	    String email = rq.getParameter("email");

	    // 서비스 호출, 세션도 함께 전달
	    mailService.sendAuthMail(email, session);
	    out.print("인증번호가 " + email + "로 발송됨.");
	}
	
	@RequestMapping(value = "/verifyAuthCode.do", method = RequestMethod.POST)
    public void verifyAuthCode(HttpServletRequest rq, HttpServletResponse rs, HttpSession sss) throws Exception {
        rq.setCharacterEncoding("utf-8");
        rs.setContentType("text/html;charset=utf-8");
        String authCode = rq.getParameter("authCode");
        String message = mailService.verifyAuthCode(authCode, sss);
        PrintWriter out = rs.getWriter();
        out.print(message);
//
//        String userAuthCode = rq.getParameter("authCode");
//        String sessionAuthCode = (String) sss.getAttribute("authCode");
//
//        if (sessionAuthCode != null && sessionAuthCode.equals(userAuthCode)) {
//            out.print("인증번호가 일치합니다.");
//        } else {
//            out.print("인증번호가 일치하지 않습니다.");
//        }
    }
}
