package money;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int User(String AC_NUMBER) {
		int HOLDING_AMOUNT = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdb:oracle:thin:@localhost:1521:system";
			String id = "test20509";
			String pw = "20509";
			conn = DriverManager.getConnection(url, id, pw);
			
			String sql = "SELECT HOLDING_AMOUNT FROM AC_INFO WHERE AC_NUMBER = ?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, AC_NUMBER);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return HOLDING_AMOUNT;
	}
}
