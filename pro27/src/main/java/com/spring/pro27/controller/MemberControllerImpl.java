package com.spring.pro27.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pro27.service.MemberService;
import com.spring.pro27.vo.MemberVO;

@Controller("memberController")
public class MemberControllerImpl extends MultiActionController implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		List<MemberVO> membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		HttpSession sss = request.getSession();
		String email = (String) sss.getAttribute("verifiedEmail");
		if(email == null) {
			ModelAndView mav = new ModelAndView("/member/memberForm");
			mav.addObject("alert", "이메일 인증을 먼저 진행해 주세요.");
			return mav;
		}
		member.setEmail(email);
		memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/removeMember.do", method=RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@RequestMapping(value="/member/updateMember.do", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		memberService.updateMember(member);
		String redirect = "redirect:/member/listMembers.do";
		return redirect;
	}
	
	@RequestMapping(value="/member/modMember.do", method=RequestMethod.GET)
	public String modMember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		return viewName;
	}
	
	@Override
	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = { "/member/login.do"}, method = {RequestMethod.POST})
	public ModelAndView login(@ModelAttribute("idpw") MemberVO member,
							  RedirectAttributes rAttr,
							  HttpServletRequest request,
							  HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		request.setCharacterEncoding("utf-8");
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/member/listMembers.do");
		} else {
			rAttr.addAttribute("result", "loginFailed"); // 메시지노출막으려면 addFlashAttribute
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = { "/member/logout.do"}, method = {RequestMethod.GET})
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	
	@RequestMapping("/testRedirect.do")
	public String testRedirect(RedirectAttributes redirectAttributes) {
	    redirectAttributes.addAttribute("message", "Test successful!");
	    return "redirect:/anotherPage";
	}
	
	@RequestMapping(value = "/member/memberForm2.do", method = RequestMethod.GET)
	public ModelAndView testing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
        String contextPath = request.getContextPath();         // 요청의 컨텍스트 경로를 가져옵니다.
        String uri = (String) request.getAttribute("javax.servlet.include.request_uri");        // 포함된 요청 URI를 가져옵니다. (서블릿 포함 시)
        if (uri == null || uri.trim().equals("")) uri = request.getRequestURI();        // 포함된 요청 URI가 null 이거나 빈 문자열일 경우, 실제 요청 URI를 가져옵니다.
        int begin = 0;        // 시작 인덱스를 설정합니다. contextPath가 비어있지 않은 경우에만 설정합니다.
        if (!(contextPath == null) && !("".equals(contextPath))) begin = contextPath.length();        
        int end;		// 종료 인덱스를 결정합니다.
        if (uri.indexOf(";") != -1) end = uri.indexOf(";");        // 세미콜론이 있는 경우, 그 위치를 종료 인덱스로 설정합니다.
        else if (uri.indexOf("?") != -1) end = uri.indexOf("?");        // 쿼리 문자열이 있는 경우, 그 위치를 종료 인덱스로 설정합니다.
        else end = uri.length();        // 둘 다 없는 경우, URI의 길이를 종료 인덱스로 설정합니다.
        String fileName = uri.substring(begin, end);        // URI에서 파일 이름을 추출합니다.
        if (fileName.indexOf(".") != -1) fileName = fileName.substring(0, fileName.lastIndexOf("."));        // 파일 이름에서 확장자가 있는 경우, 확장자를 제거합니다.
        if (fileName.indexOf("/") != -1) fileName = fileName.substring(fileName.lastIndexOf("/", 1), fileName.length());
        return fileName;
    }
}
