package com.spring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface MemberController {
    // 회원 목록을 반환하는 메소드
    ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;

    // 회원 추가 메소드
    ModelAndView addMember(HttpServletRequest request, HttpServletResponse response) throws Exception;

    // 회원 삭제 메소드
    ModelAndView removeMember(HttpServletRequest request, HttpServletResponse response) throws Exception;

    // 회원 추가 및 수정 폼을 반환하는 메소드
    ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
