<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
	String id = request.getParameter("id");
    String pw_1 = request.getParameter("pw_1");
    String pw_2 = request.getParameter("pw_2");
    String date = request.getParameter("date_");
    if(pw_1.equals(pw_2)){
    	ResultSet rs = null;
		PreparedStatement stmt = null;
		String sql = "";
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
		String url = "jdb:oracle:thin:@localhost:1521:system";
		String id_ = "test20509";
		String pw = "20509";
		Connection conn = DriverManager.getConnection(url, id_, pw);
	
		sql = "INSERT INTO USER_INFO VALUES((select nvl(max(USER_CODE),0) + 1 from USER_INFO),?,TO_DATE(?,'YYYY-MM-DD'),?,?)";
	
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, name);
		stmt.setString(2, date);
		stmt.setString(3, id);
		stmt.setString(4, pw_1);
	
		stmt.executeUpdate();
    }else{
    	out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
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
			<h2><%=name%>님 안녕하세요.
			</h2>
			<h2>회원가입이 완료 되셨습니다.
			</h2>
			<h2> </h2>
			<a href="./index.jsp"><p id="button">처음으로</p></a>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>