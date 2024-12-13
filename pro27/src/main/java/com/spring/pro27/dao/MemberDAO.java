package com.spring.pro27.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.pro27.vo.MemberVO;

public interface MemberDAO {
    // 모든 회원 목록을 반환하는 메소드
    List<MemberVO> selectAllMemberList() throws DataAccessException;

    // 회원 추가 메소드
    int insertMember(MemberVO memberVO) throws DataAccessException;

    // 회원 삭제 메소드
    int deleteMember(String id) throws DataAccessException;
    
    // 회원정보 수정 메서드
    int updateMember(MemberVO memberVO) throws DataAccessException;
    
    int login(MemberVO memberVO) throws DataAccessException;
}
