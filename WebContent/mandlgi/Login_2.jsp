<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	int USER_CODE = 0;
	int count = 0;

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id_1 = "test20509";
	String pw_1 = "20509";
	Connection conn = DriverManager.getConnection(url, id_1, pw_1);
	sql = "SELECT * FROM USER_INFO WHERE ID = ? AND PW = ?";

	stmt = conn.prepareStatement(sql);
	
	stmt.setString(1, id);
	stmt.setString(2, pw);
	
	rs = stmt.executeQuery();
	
	if (rs.next()) {
		USER_CODE = rs.getInt("USER_CODE");
		count++;
	}
	
	if(count == 0) {
		out.println("<script>alert('아이디/비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
	}else{
		session.setAttribute("user_code", USER_CODE);
		response.sendRedirect("./index.jsp");
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 중..</title>
</head>
<body>

</body>
</html>