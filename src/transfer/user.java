package transfer;

import java.sql.*;

public class user {
	private String ac1 = "";
	private String ac2 = "";
	private int num = 0;

	public user(String ac1, String ac2, int num) {
		this.ac1 = ac1;
		this.ac2 = ac2;
		this.num = num;
	}

	public void DB() {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		int HOLDING_AMOUNT = 0;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdb:oracle:thin:@localhost:1521:system";
			String id = "test20509";
			String pw = "20509";
			Connection conn = DriverManager.getConnection(url, id, pw);

			sql = "SELECT HOLDING_AMOUNT FROM AC_INFO WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ac1);

			rs = stmt.executeQuery();

			if (rs.next()) {
				HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
			}

			sql = "UPDATE AC_INFO SET HOLDING_AMOUNT = ? WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (HOLDING_AMOUNT - num));
			stmt.setString(2, ac1);

			stmt.executeUpdate();

			sql = "SELECT HOLDING_AMOUNT FROM AC_INFO WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ac2);

			rs = stmt.executeQuery();

			if (rs.next()) {
				HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
			}
			sql = "UPDATE AC_INFO SET HOLDING_AMOUNT = ? WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (HOLDING_AMOUNT + num));
			stmt.setString(2, ac2);

			stmt.executeUpdate();

			sql = "INSERT INTO AC_TRADE VALUES((select nvl(max(TRANSACTION_NUMBER),0) + 1 from AC_TRADE),?,?,TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),?,1)";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, ac1);
			stmt.setString(2, ac2);
			stmt.setInt(3, num);

			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
