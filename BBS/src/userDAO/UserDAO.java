package userDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import userDTO.UserDTO;

public class UserDAO {
	
	
	private Connection con;
	private PreparedStatement ps; 
	private ResultSet rs;
	
	public UserDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "oracle";
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID , String userPassword) {
		String sql = "select userPassword from userInfo where userID = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userID);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공 
				}
				return 0; //비밀번호 불일치
			}
			return -1; //아이디가 없을 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;//데이터베이스 오류
	}
	
	public int join(UserDTO userDTO) {
		String sql = "insert into userInfo values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, userDTO.getUserID());
			ps.setString(2, userDTO.getUserPassword());
			ps.setString(3, userDTO.getUserName());
			ps.setString(4, userDTO.getUserGender());
			ps.setString(5, userDTO.getUserEmail());
			return ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return 0;
	}
	
}
