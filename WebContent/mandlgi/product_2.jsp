<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int USER_CODE = 0;
	try {
		USER_CODE = (Integer) session.getAttribute("user_code");
	} catch (Exception e) {
		out.println("<script>alert('(Erorr)로그인 후 이용가능한 서비스입니다.');</script>");
		response.sendRedirect("./index.jsp");
	}

	int type = Integer.parseInt(request.getParameter("type"));
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	int HOLDING_AMOUNT = 0;
	int AC_NUMBER = 0;

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id = "test20509";
	String pw = "20509";
	Connection conn = DriverManager.getConnection(url, id, pw);
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
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WJ Bank - 우주 은행</title>
<link rel="stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" src="js/js.js"></script>
</head>

<body>
	<div id="main">
		<div id="head">
			<h1>WJ BANK - 우주 은행</h1>
		</div>
		<div id="body">
			<h2><%=USER_CODE%>님의 계좌가 개설되었습니다
			</h2>
			<h2>
				계좌번호 :
				<%=AC_NUMBER%>
			</h2>
			<h2></h2>
			<a href="./index.jsp"><p id="button">처음으로</p></a>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>