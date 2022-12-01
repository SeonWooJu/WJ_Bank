package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DB.DBConnection;
import VO.UserInfoVO;

public class BankDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String sql = "";
	
	public int getMoney(int ac1) {
		int money = 0;
		
		try {
			conn = DBConnection.getConnection();
			sql = "SELECT HOLDING_AMOUNT FROM AC_INFO WHERE AC_NUMBER = ?";
	
			stmt = conn.prepareStatement(sql);
	
			stmt.setInt(1, ac1);
	
			rs = stmt.executeQuery();
	
			if (rs.next()) {
				money = rs.getInt("HOLDING_AMOUNT");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
		
		return money;
	}
	
	public String getPassword(int USER_CODE) {
		String pw = null;
		try {
			conn = DBConnection.getConnection();
			sql = "SELECT PW FROM USER_INFO WHERE USER_CODE = ?";

			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, USER_CODE);

			rs = stmt.executeQuery();

			if (rs.next()) {
				pw = rs.getString("PW");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
		return pw;
	}
	
	public void moneyTransferring(int ac1, int ac2, int num) {
		int HOLDING_AMOUNT = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);

			sql = "SELECT HOLDING_AMOUNT FROM AC_INFO WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ac1);

			rs = stmt.executeQuery();

			if (rs.next()) {
				HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
			}

			sql = "UPDATE AC_INFO SET HOLDING_AMOUNT = ? WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (HOLDING_AMOUNT - num));
			stmt.setInt(2, ac1);

			stmt.executeUpdate();

			sql = "SELECT HOLDING_AMOUNT FROM AC_INFO WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ac2);

			rs = stmt.executeQuery();

			if (rs.next()) {
				HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
			}
			sql = "UPDATE AC_INFO SET HOLDING_AMOUNT = ? WHERE AC_NUMBER = ?";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, (HOLDING_AMOUNT + num));
			stmt.setInt(2, ac2);

			stmt.executeUpdate();

			sql = "INSERT INTO AC_TRADE VALUES((select nvl(max(TRANSACTION_NUMBER),0) + 1 from AC_TRADE),?,?,TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),?,1)";

			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ac1);
			stmt.setInt(2, ac2);
			stmt.setInt(3, num);

			stmt.executeUpdate();
			
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2){
				e2.printStackTrace();
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
	}

	public void joinMembership(String name, String date, String id, String pw_1) {
		try {
			conn = DBConnection.getConnection();

			sql = "INSERT INTO USER_INFO VALUES((select nvl(max(USER_CODE),0) + 1 from USER_INFO),?,TO_DATE(?,'YYYY-MM-DD'),?,?)";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, date);
			stmt.setString(3, id);
			stmt.setString(4, pw_1);

			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
	}

	public int memberLogin(String id, String pw) {
		int USER_CODE = 0;
		try {
			conn = DBConnection.getConnection();
			sql = "SELECT * FROM USER_INFO WHERE ID = ? AND PW = ?";

			stmt = conn.prepareStatement(sql);

			stmt.setString(1, id);
			stmt.setString(2, pw);

			rs = stmt.executeQuery();

			if (rs.next()) {
				USER_CODE = rs.getInt("USER_CODE");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}

		return USER_CODE;
	}

	public int makeAccount(int type, int USER_CODE) {
		int AC_NUMBER = 0;
		try {
		conn = DBConnection.getConnection();
		conn.setAutoCommit(false);
		
		sql = "SELECT MAX(AC_NUMBER) + 1 AS AC_NUMBER FROM AC_INFO";

		stmt = conn.prepareStatement(sql);

		rs = stmt.executeQuery();

		if (rs.next()) {
			AC_NUMBER = rs.getInt("AC_NUMBER");
		}

		sql = "INSERT INTO AC_INFO VALUES(?,0,?)";

		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, AC_NUMBER);
		stmt.setInt(2, type);

		stmt.executeUpdate();

		sql = "INSERT INTO USER_AC VALUES(?,?)";

		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, USER_CODE);
		stmt.setInt(2, AC_NUMBER);

		stmt.executeUpdate();
		
		conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.commit();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
		return AC_NUMBER;
	}

	public void getMemberUpdate(int USER_CODE, String id, String pw_1) {
		try {
			conn = DBConnection.getConnection();

			sql = "UPDATE USER_INFO SET ID = ?, PW = ? WHERE USER_CODE = ?";

			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, id);
			stmt.setString(2, pw_1);
			stmt.setInt(3, USER_CODE);

			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
	}
	
	public UserInfoVO getUserInfo(int USER_CODE) {
		UserInfoVO vo = new UserInfoVO();
		try {
			conn = DBConnection.getConnection();
			sql = "SELECT * FROM USER_INFO WHERE USER_CODE = ?";

			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, USER_CODE);

			rs = stmt.executeQuery();

			if (rs.next()) {
				String ID = rs.getString("ID");
				String PW = rs.getString("PW");
				
				vo.setID(ID);
				vo.setPW(PW);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (stmt != null)
				try {
					stmt.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
		}
		return vo;
		
	}

	public int getAllMoney(int USER_CODE){
		int HOLDING_AMOUNT = 0;
		try{
			conn = DBConnection.getConnection();
			
			sql = "SELECT U.USER_CODE,SUM(A.HOLDING_AMOUNT) AS HOLDING_AMOUNT " + "FROM USER_AC U, AC_INFO A "
					+ "WHERE U.AC_NUMBER = A.AC_NUMBER AND U.USER_CODE = ? " + "GROUP BY U.USER_CODE";
	
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, USER_CODE);
	
			rs = stmt.executeQuery();
	
			if (rs.next()) {
				HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
			}
			
		}	catch (Exception e) {
			e.printStackTrace();
		}
		return HOLDING_AMOUNT;
	}
	
}
