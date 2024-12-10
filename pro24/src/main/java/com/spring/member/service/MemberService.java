package com.spring.member.service;

import java.util.List;
import org.springframework.dao.DataAccessException;
import com.spring.member.vo.MemberVO;

public interface MemberService {
    // 모든 회원 목록을 반환하는 메소드
    List<MemberVO> listMembers() throws DataAccessException;

    // 회원 추가 메소드
    int addMember(MemberVO memberVO) throws DataAccessException;

    // 회원 삭제 메소드
    int removeMember(String id) throws DataAccessException;
    
    int updateMember(MemberVO membervo) throws DataAccessException;
}
