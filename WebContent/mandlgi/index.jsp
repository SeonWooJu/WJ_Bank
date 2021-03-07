<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int USER_CODE = 0;
	String mm = "";
	String logoin1 = "";
	String logoin2 = "";
	try {
		USER_CODE = (Integer) session.getAttribute("user_code");
	} catch (Exception e) {
		USER_CODE = 0;
	}
	if(USER_CODE == 0){
		mm = "로그인 후 조회 가능합니다";
		logoin1 = "./Login.jsp";
		logoin2 = "로그인";
	}else {
		ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
		int HOLDING_AMOUNT = 0;

		Class.forName("oracle.jdbc.driver.OracleDriver");

		String url = "jdb:oracle:thin:@localhost:1521:system";
		String id = "test20509";
		String pw = "20509";
		Connection conn = DriverManager.getConnection(url, id, pw);

		sql = "SELECT U.USER_CODE,SUM(A.HOLDING_AMOUNT) AS HOLDING_AMOUNT " + "FROM USER_AC U, AC_INFO A "
				+ "WHERE U.AC_NUMBER = A.AC_NUMBER AND U.USER_CODE = ? " + "GROUP BY U.USER_CODE";

		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, USER_CODE);

		rs = stmt.executeQuery();

		if (rs.next()) {
			HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
		}
		mm = HOLDING_AMOUNT+"원";
		logoin1 = "./logout.jsp";
		logoin2 = "로그아웃";
	}
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
			<div id="body_left">
				<ul>
					<li class="solid"></li>
					<li><a href="./transfer.jsp">이체</a></li>
					<li class="solid"></li>
					<li><a href="./product.jsp">상품가입</a></li>
					<li class="solid"></li>
					<li><a href="./List.jsp">거래내역</a></li>
					<li class="solid"></li>
				</ul>
			</div>
			<div id="body_center">
				<div>
					<h2 id="money"><%=mm%>
					</h2>
				</div>
				<p id="button" onclick="inquiry()">금액조회</p>
			</div>
			<div id="body_right">
				<ul>
					<li class="solid"></li>
					<li><a href="<%=logoin1 %>"><%=logoin2 %></a></li>
					<li class="solid"></li>
					<li><a href="./join.jsp">회원가입</a></li>
					<li class="solid"></li>
					<li><a href="">이용안내</a></li>
					<li class="solid"></li>
				</ul>
			</div>
		</div>
		<div id="footer">
			<h1>footer임</h1>
		</div>
	</div>
</body>
</html>