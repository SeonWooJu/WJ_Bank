<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id = "test20509";
	String pw = "20509";
	Connection conn = DriverManager.getConnection(url, id, pw);

	sql = "SELECT * FROM AC_TRADE ORDER BY TRANSACTION_NUMBER DESC";

	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#border {
	border: 1px solid black;
	text-align: center;
}
</style>
</head>
<body>
	<table id="border">
		<thead>
			<tr>
				<th id="border">거래 번호</th>
				<th id="border">보내는 계좌</th>
				<th id="border">받는 계좌</th>
				<th id="border">거래 시간</th>
				<th id="border">금액</th>
				<th id="border">거래 방법</th>
			</tr>
		</thead>
		<tbody>
			<%
				while (rs.next()) {
					int TRANSACTION_NUMBER = rs.getInt("TRANSACTION_NUMBER");
					String AC_NUMBER_IN = rs.getString("AC_NUMBER_IN");
					String AC_NUMBER_OUT = rs.getString("AC_NUMBER_OUT");
					String TRANSACTION_TIME = rs.getString("TRANSACTION_TIME");
					int MONEY = rs.getInt("MONEY");
					int TRANSACTION_METHOD = rs.getInt("TRANSACTION_METHOD");
			%>
			<tr>
				<td id="border"><%=TRANSACTION_NUMBER%></td>
				<td id="border"><%=AC_NUMBER_IN%></td>
				<td id="border"><%=AC_NUMBER_OUT%></td>
				<td id="border"><%=TRANSACTION_TIME%></td>
				<td id="border"><%=MONEY%></td>
				<td id="border"><%=TRANSACTION_METHOD%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>



</body>
</html>