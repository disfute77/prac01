package dao;

import java.sql.*;
import dto.Member;

public class MemberJanitor {
	//필드
	Connection conn = null;
	
	//생성자(싱글톤)
	private static MemberJanitor instance;
	
	public static MemberJanitor getInstance() {
		if(instance==null) {
			instance = new MemberJanitor();
		}
		return instance;
	}
	
	private MemberJanitor() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String connUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String connId = "system";
			String connPw = "oracle";
			conn = DriverManager.getConnection(connUrl, connId, connPw);
			System.out.println("디버깅 메시지 - 회원 데이터베이스에 접속");
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 회원 데이터베이스 접속 실패");
			//e.printStackTrace();
		}
	}
	
	public int signUp(Member member) {
		CallableStatement cstmt = null;
		try {
			String sql = " { call prac1signup(?, ?, ?, ?, ?, ?, ?, ?, ?) } ";
            cstmt = conn.prepareCall(sql);
            cstmt.setString(1, member.getId());
            cstmt.setString(2, member.getPw());
            cstmt.setString(3, member.getName());
            cstmt.setString(4, member.getSex());
            cstmt.setString(5, member.getBirth8());
            cstmt.setString(6, member.getPhone());
            cstmt.setString(7, member.getMail());
            cstmt.setString(8, member.getAddress());
            cstmt.registerOutParameter(9, Types.INTEGER); //판정용 정수값
            cstmt.execute();
            int resultInt = cstmt.getInt(9); //0=아이디 중복 1=회원가입 성공
            cstmt.close();
            return resultInt;
		} catch(Exception e) {
			//e.printStackTrace();
			System.out.println("디버깅 메시지 - 오류코드 MemberJanitor.signup");
			return -1;
		}
	}
	
	public int isDupl(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int dupl;
		try {
			String sql = " SELECT * FROM Practice1Members WHERE id = ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			boolean b = rs.next();
			if(b) {dupl = 1;} else {dupl = 0;}
			rs.close();	pstmt.close();
			return dupl;
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 오류코드 MemberJanitor.isDupl");
			e.printStackTrace();
			return -1;
		}
	}
	
}
