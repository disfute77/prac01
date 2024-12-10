package com.spring.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.spring.member.service.MemberService;
import com.spring.member.service.MemberServiceImpl;
import com.spring.member.vo.MemberVO;

public class MemberControllerImpl extends MultiActionController implements MemberController {
	private MemberService memberService;
	public void setMemberService(MemberServiceImpl memberService) {this.memberService = memberService;}
	
	@Override
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List<MemberVO> membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	public ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO memberVO = new MemberVO();
		bind(request, memberVO); //멀티액션컨트롤러의 bind 메서드로 요청과 memberVO의 프로퍼티들을 매칭시킨듯?
		memberService.addMember(memberVO); //회원가입 시킨거라 뭐 보여줄건없고 대신 리스트멤버스로 보내서 확인시키는것. 그래서 모델은 없고 뷰이름만 있음.
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@Override
	public ModelAndView removeMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	public ModelAndView updateMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO memberVO = new MemberVO();
		bind(request, memberVO); //멀티액션컨트롤러의 bind 메서드로 요청과 memberVO의 프로퍼티들을 매칭시킨듯?
		memberService.updateMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@Override
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	public ModelAndView modMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
        // 요청의 컨텍스트 경로를 가져옵니다.
        String contextPath = request.getContextPath();
        
        // 포함된 요청 URI를 가져옵니다. (서블릿 포함 시)
        String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
        
        // 포함된 요청 URI가 null이거나 빈 문자열일 경우, 실제 요청 URI를 가져옵니다.
        if (uri == null || uri.trim().equals("")) uri = request.getRequestURI();

        // 시작 인덱스를 설정합니다. contextPath가 비어있지 않은 경우에만 설정합니다.
        int begin = 0;
        if (!(contextPath == null) && !("".equals(contextPath))) begin = contextPath.length();
        
        // 종료 인덱스를 결정합니다.
        int end;
        // 세미콜론이 있는 경우, 그 위치를 종료 인덱스로 설정합니다.
        if (uri.indexOf(";") != -1) end = uri.indexOf(";");
        // 쿼리 문자열이 있는 경우, 그 위치를 종료 인덱스로 설정합니다.
        else if (uri.indexOf("?") != -1) end = uri.indexOf("?");
        // 둘 다 없는 경우, URI의 길이를 종료 인덱스로 설정합니다.
        else end = uri.length();

        // URI에서 파일 이름을 추출합니다.
        String fileName = uri.substring(begin, end);
        
        // 파일 이름에서 확장자가 있는 경우, 확장자를 제거합니다.
        if (fileName.indexOf(".") != -1) fileName = fileName.substring(0, fileName.lastIndexOf("."));
        
        // 파일 이름에서 마지막 슬래시 이후의 문자열만 남깁니다.
        if (fileName.indexOf("/") != -1) fileName = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.length());

        // 최종적으로 추출된 파일 이름을 반환합니다.
        return fileName;
    }
}
