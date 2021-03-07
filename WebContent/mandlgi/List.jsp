<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int AC_NUMBER = 110001;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	int count = 0;

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id = "test20509";
	String pw = "20509";
	Connection conn = DriverManager.getConnection(url, id, pw);

	sql = "SELECT * FROM AC_TRADE WHERE AC_NUMBER_IN = ? OR AC_NUMBER_OUT = ? ORDER BY TRANSACTION_NUMBER DESC";

	stmt = conn.prepareStatement(sql);
	stmt.setInt(1, AC_NUMBER);
	stmt.setInt(2, AC_NUMBER);

	rs = stmt.executeQuery();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WJ Bank - 우주 은행</title>
<link rel="stylesheet" type="text/css" href="css/css.css?after">
<script type="text/javascript" src="js/js.js"></script>
</head>

<body>
	<div id="main">
		<div id="head">
			<h1>WJ BANK - 우주 은행</h1>
		</div>
		<div id="body">
			<table style="margin: 0px auto;">
				<thead>
					<tr>
						<th class="table_list" style="width: 280px;">거래 시간</th>
						<th class="table_list" style="width: 200px;">보낸 계좌</th>
						<th class="table_list" style="width: 200px;">받은 계좌</th>
						<th class="table_list" style="width: 150px;">금액</th>
					</tr>
				</thead>
				<tbody>
					<%
						while (rs.next() && count < 11) {
							String TRANSACTION_TIME = rs.getString("TRANSACTION_TIME");
							int AC_NUMBER_IN = rs.getInt("AC_NUMBER_IN");
							int AC_NUMBER_OUT = rs.getInt("AC_NUMBER_OUT");
							int MONEY = rs.getInt("MONEY");
					%>
					<tr>
						<td class="table_list"	><%=TRANSACTION_TIME%></td>
						<td class="table_list"><%=AC_NUMBER_IN%></td>
						<td class="table_list"><%=AC_NUMBER_OUT%></td>
						<td class="table_list"><%=MONEY%></td>
					</tr>
					<%
						count++;
						}
					%>
				</tbody>
			</table>
			<a href="./index.jsp"><p id="button">처음으로</p></a>
		</div>
		<div id="footer">
			<h1>footer임</h1>
		</div>
	</div>
</body>
</html>