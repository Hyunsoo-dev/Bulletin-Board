package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.websocket.Session;

public class BbsDAO {
	
	private Connection con;
	
	private ResultSet rs;
	
	public BbsDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "1234";
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String sql = "SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD'),TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL";
		
		try {	
			PreparedStatement ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				//String str = rs.getString(1);
				//String str2 = rs.getString(2);
				//return str + str2;
				return rs.getString(1) + rs.getString(2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	
	public int getNext() {
		String sql = "select bbsID from BBS order by bbsID desc";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;//첫번째 게시물
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(BbsDTO dto , String userID) {
	String sql = "insert into BBS values (?,?,?,?,?,?)";
		
		try {
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, getNext());
			ps.setString(2, dto.getBbsTitle());
			ps.setString(3, userID);
			ps.setString(4, getDate());
			ps.setString(5, dto.getBbsContent());
			ps.setInt(6, 1);
			return ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	} 
	
	//게시판 내용 조회
	public ArrayList<BbsDTO> getList(int pageNumber){
		ArrayList<BbsDTO> list = new ArrayList<BbsDTO>();
		String sql = "select * from BBS where bbsID < ? and bbsAvailable = 1 order by bbsID desc";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, getNext() - (pageNumber -1)*10);
			rs = ps.executeQuery();
			while(rs.next()) {
				BbsDTO bbsDTO = new BbsDTO();
				bbsDTO.setBbsID(rs.getInt(1));
				bbsDTO.setBbsTitle(rs.getString(2));
				bbsDTO.setUserID(rs.getString(3));
				bbsDTO.setBbsDate(rs.getString(4));
				bbsDTO.setBbsContent(rs.getString(5));
				bbsDTO.setBbsAvailable(rs.getInt(6));
				list.add(bbsDTO);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류
	}
	
	public boolean nextPage(int pageNumber) {
		String sql = "select * from BBS where bbsID < ? and bbsAvailable = 1";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, getNext() - (pageNumber -1)*10);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
		
	}
	
	public BbsDTO getBbs(int bbsID) {
		String sql = "select * from bbs where bbsID = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, bbsID);
			rs = ps.executeQuery();
			while(rs.next()) {
				BbsDTO bbsDTO = new BbsDTO();
				bbsDTO.setBbsTitle(rs.getString(2));
				bbsDTO.setUserID(rs.getString(3));
				bbsDTO.setBbsDate(rs.getString(4));
				bbsDTO.setBbsContent(rs.getString(5));
				return bbsDTO;
				
			}					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int bbsID , String bbsTitle , String bbsContent) {
		String sql = "update bbs set bbsTitle=?, bbsContent=? where bbsID=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, bbsTitle);
			ps.setString(2, bbsContent);
			ps.setInt(3, bbsID);
			
			return ps.executeUpdate();
			
								
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
	
	public int delete(int bbsID) {
		String sql = "delete from bbs where bbsID = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			;
			ps.setInt(1, bbsID);
			
			return ps.executeUpdate();
			
								
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	
}
