package com.spring.pro27.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.pro27.vo.MemberVO;

public interface MemberController {
    // 회원 목록을 반환하는 메소드
    ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;

    // 회원 추가 메소드
    ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;

    // 회원 삭제 메소드
    public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;

    // 회원 추가 및 수정 폼을 반환하는 메소드
    ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
    
    ModelAndView login(@ModelAttribute("idpw") MemberVO member,
    										RedirectAttributes rAttr,
			  								 HttpServletRequest request,
			  								HttpServletResponse response) throws Exception;
    
    ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
