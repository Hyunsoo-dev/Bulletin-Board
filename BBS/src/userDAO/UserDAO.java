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
					return 1; //�α��� ���� 
				}
				return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵� ���� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2;//�����ͺ��̽� ����
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
