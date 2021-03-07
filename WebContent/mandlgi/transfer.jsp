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
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id = "test20509";
	String pw = "20509";
	Connection conn = DriverManager.getConnection(url, id, pw);

	sql = "SELECT a.AC_NUMBER AS AC_NUMBER, A.HOLDING_AMOUNT AS HOLDING_AMOUNT FROM USER_AC U, AC_INFO A "
			+ "WHERE U.AC_NUMBER = A.AC_NUMBER AND U.USER_CODE = ? AND AC_TYPE = 1 ORDER BY AC_NUMBER DESC";

	stmt = conn.prepareStatement(sql);
	stmt.setInt(1, USER_CODE);

	rs = stmt.executeQuery();
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
			<h2>이체하실 계좌와 금액을 입력해주세요</h2>
			<form action="transfer_2.jsp" method="post">
				<input id="input" type="text" name="ac2" placeholder="계좌번호">
				<br> <br>
				<input id="input" type="text" name="num" placeholder="금액">
				<input id="button_2" type="submit" value="송금하기"> 
				<select name="ac1">
					<option value="">송금 계좌선택</option>
						<%
							while (rs.next()) {
								int AC_NUMBER = rs.getInt("AC_NUMBER");
								int HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
							%>
						<option value="<%=AC_NUMBER%>"><%=AC_NUMBER%> (잔액:<%=HOLDING_AMOUNT%>)
					</option>
					<%
						}
					%>
				</select>
			</form>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>