package com.spring.pro27.ex03;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.pro27.vo.MemberVO;

@RestController
@RequestMapping("/test/*")
public class TestController {
	static Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@RequestMapping("/hello")
	public String hello(HttpServletResponse rs) {
		rs.setCharacterEncoding("utf-8");
		return "메시지, asdfasdf";
	}
	
	@RequestMapping("/member")
	public MemberVO member() {
		MemberVO vo = new MemberVO();
		vo.setId("a");
		vo.setPwd("b");
		vo.setName("c");
		vo.setEmail("d@f.e");
//		java.util.Date now = new java.util.Date();
//		java.sql.Date sqlnow = new java.sql.Date(now.getTime());
//		vo.setJoinDate(sqlnow);
		return vo;
	}
	
	@RequestMapping("/membersList")
	public List<MemberVO> listMembers() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		for (int i = 0; i<10; i++) {
			MemberVO vo = new MemberVO();
			vo.setId("으악"+i);
			vo.setPwd("비번"+i);
			vo.setName("이름"+i);
			vo.setEmail("이메일@g.c"+i);
			list.add(vo);
		}
		return list;
	}
	
	@RequestMapping("/membersList2")
	public ResponseEntity<List<MemberVO>> listMembers2() {
		List<MemberVO> list = new ArrayList<MemberVO>();
		for(int i=0; i<7; i++) {
			MemberVO vo = new MemberVO();
			vo.setId("tempID"+i);
			vo.setPwd("tempPwd"+i);
			vo.setName("tempName"+i);
			vo.setEmail("tempMail"+i+"@te.mp");
			list.add(vo);
		}
		return new ResponseEntity(list, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value="/notice/{num}", method=RequestMethod.GET)
	public String notice(@PathVariable("num") int num) throws Exception {
		String msg = "wachuneedis"+num;
		return msg;
	}
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public void modify(@RequestBody MemberVO vo) {
		logger.info(vo.getId()+vo.getPwd()+vo.getName()+vo.getEmail());
	}
	
	
}
