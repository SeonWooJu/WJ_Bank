<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ac1 = request.getParameter("ac1");
	String ac2 = request.getParameter("ac2");
	int me = Integer.parseInt(request.getParameter("me"));
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	int HOLDING_AMOUNT = 0;

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
	stmt.setInt(1, (HOLDING_AMOUNT - me));
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
	stmt.setInt(1, (HOLDING_AMOUNT + me));
	stmt.setString(2, ac2);

	stmt.executeUpdate();

	sql = "INSERT INTO AC_TRADE VALUES((select nvl(max(TRANSACTION_NUMBER),0) + 1 from AC_TRADE),?,?,TO_CHAR(SYSDATE,'YYYY/MM/DD HH24:MI:SS'),?,1)";

	stmt = conn.prepareStatement(sql);
	stmt.setString(1, ac1);
	stmt.setString(2, ac2);
	stmt.setInt(3, me);

	stmt.executeUpdate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=ac1%>계좌에서
		<%=ac2%>계좌로
		<%=me%>원을 송금하였습니다.
	</h2>
</body>
</html>