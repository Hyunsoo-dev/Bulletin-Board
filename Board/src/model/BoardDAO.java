package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {

	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	
	public void getCon() {
		try {
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "system";
			String pw = "1234";
			String driver = "oracle.jdbc.driver.OracleDriver";
		
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
					
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
}
