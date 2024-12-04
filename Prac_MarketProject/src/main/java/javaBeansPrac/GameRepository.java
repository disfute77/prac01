package javaBeansPrac;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class GameRepository {
	
	Connection conn = null;
	
	public GameRepository() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String connUrl = "jdbc:oracle:thin:@localhost:1521/xe";
			String connId = "system";
			String connPw = "oracle";
			conn = DriverManager.getConnection(connUrl, connId, connPw);
			System.out.println("디버깅 메시지 - 게임박물관 프로젝트 데이터베이스에 접속합니다.");
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 데이터베이스에 접속하지 못했습니다.");
			//e.printStackTrace();
		}
	}
	//생성자. 자동 DB 로그인.
	
	private ArrayList<Game> packageofGames;
	//Game 형만 들어가는 배열 패키지오브게임스.
	//Game 객체는 필드로 각종 속성(게임이름, 가격 등...)을 갖고있음.
	
	public ArrayList<Game> getPackageofGames() {
		return packageofGames;
	}

	public void setPackageofGames(ArrayList<Game> packageofGames) {
		this.packageofGames = packageofGames;
	}
	
	public ArrayList<Game> getSomeGames() {
		ArrayList<Game> temp = new ArrayList<Game>();
		setPackageofGames(temp);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = " SELECT * FROM dbandimg ";
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				Game a=new Game();
				a.setGameId(rs.getString("gameid"));
				a.setName(rs.getString("name"));
				a.setGamePrice(rs.getInt("gameprice"));
				a.setDeveloper(rs.getString("developer"));
				a.setPublisher(rs.getString("publisher"));
				a.setGenre(rs.getString("genre"));
				
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					String date8 = sdf.format(rs.getDate("releaseDate"));
				a.setReleaseDate(date8);
				
					boolean b = switch(rs.getInt("havedlc")){
					case 1 -> true;
					case 0 -> false;
					default -> false;
					};
				a.setHaveDlc(b);
				a.setDescription(rs.getString("description"));
				a.setMainimg(rs.getString("mainimg"));
				a.setSubimg1(rs.getString("subimg1"));
				a.setSubimg2(rs.getString("subimg2"));
				a.setSubimg3(rs.getString("subimg3"));
				a.setSubimg4(rs.getString("subimg4"));
				packageofGames.add(a);
			}
			rs.close();	pstmt.close();
			
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 오류코드 .getSomeGames");
			e.printStackTrace();
			
		}
		
		return packageofGames;
	}
	//겟올게임? 모든게임을 가져올 필요도 없고 그래서도 안됨. 지금은 그냥 예제용으로 몇개 안들어가있으니 쓰는거임.
	//실제로 쓰려면 get6Games 정도로 끝내야할듯.

	public Game getGameById(String gameId) {
		Game a=new Game();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = " SELECT * FROM dbandimg WHERE gameId = ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, gameId);
			rs = pstmt.executeQuery();			
			while(rs.next()) {
				a.setGameId(rs.getString("gameid"));
				a.setName(rs.getString("name"));
				a.setGamePrice(rs.getInt("gameprice"));
				a.setDeveloper(rs.getString("developer"));
				a.setPublisher(rs.getString("publisher"));
				a.setGenre(rs.getString("genre"));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					String date8 = sdf.format(rs.getDate("releaseDate"));
				a.setReleaseDate(date8);
				boolean b = switch(rs.getInt("havedlc")){
				case 1 -> true;
				case 0 -> false;
				default -> false;
				};
				a.setHaveDlc(b);
				a.setDescription(rs.getString("description"));
				a.setMainimg(rs.getString("mainimg"));
				a.setSubimg1(rs.getString("subimg1"));
				a.setSubimg2(rs.getString("subimg2"));
				a.setSubimg3(rs.getString("subimg3"));
				a.setSubimg4(rs.getString("subimg4"));
			}
			rs.close();	pstmt.close();
			return a;
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 오류코드 .getGameById");
			e.printStackTrace();
			return null;
		}	
	}
	//gameid 넣으면 해당되는정보가 필드에 들어있는 Game형 객체 반환하는 메서드
	//CRUD 중 READ
	
	public int insertGameInfo(Game newGame) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		try {
			String sql = " INSERT INTO practice1gamedb VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, newGame.getGameId());
			pstmt.setString(2, newGame.getName());
			pstmt.setInt(3, newGame.getGamePrice());
			pstmt.setString(4, newGame.getDeveloper());
			pstmt.setString(5, newGame.getPublisher());
			pstmt.setString(6, newGame.getGenre());
			
				String date8 = newGame.getReleaseDate();
				Date sqlDate = Date.valueOf(date8);
			pstmt.setDate(7, sqlDate);
				int i; if(newGame.getHaveDlc()) {i=1;} else {i=0;}
			pstmt.setInt(8, i);
			pstmt.setString(9, newGame.getDescription());
			pstmt.executeQuery();	
			
			String sql2 = " INSERT INTO practice1gameimg VALUES(?, ?, ?, ?, ?, ?) ";
			pstmt2=conn.prepareStatement(sql2);
			pstmt2.setString(1, newGame.getGameId());
			pstmt2.setString(2, newGame.getMainimg());
			pstmt2.setString(3, newGame.getSubimg1());
			pstmt2.setString(4, newGame.getSubimg2());
			pstmt2.setString(5, newGame.getSubimg3());
			pstmt2.setString(6, newGame.getSubimg4());
			pstmt2.executeQuery();
			
			return 1;
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 오류코드 .insertGameInfo");
			e.printStackTrace();
			return -1;
		}
	}
	//폼에서 작성한 데이터를 Game형 객체 필드에 담아서 주면 그거 풀어서 테이블 두개에 따로 저장하는 메서드.
	//CRUD 중 CREATE
	
	public int isDuplGame(String gameId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int dupl;
		try {
			String sql = " SELECT * FROM practice1gamedb WHERE gameId = ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, gameId);
			rs = pstmt.executeQuery();			
			boolean b = rs.next();
			if(b) {dupl = 1;} else {dupl = 0;}
			rs.close();	pstmt.close();
			return dupl;
		} catch(Exception e) {
			System.out.println("디버깅 메시지 - 오류코드 .isDuplGame");
			e.printStackTrace();
			return -1;
		}
	}
	//게임ID중복검사. 중복이면 1, 아니면 0, 오류나면 -1 반환.
	//CRUD 중 READ
}
