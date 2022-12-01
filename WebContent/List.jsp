<%@page import="DB.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	try {
		int USER_CODE = 0;
		try {
			USER_CODE = (Integer) session.getAttribute("user_code");
		} catch (Exception e) {
			out.println("<script>alert('[Erorr]로그인 후 이용가능한 서비스입니다.');window.location.href='./index.jsp'</script>");
			//response.sendRedirect("./index.jsp");
		}
		
		conn = DBConnection.getConnection();
		
		sql = "SELECT a.AC_NUMBER AS AC_NUMBER, A.HOLDING_AMOUNT AS HOLDING_AMOUNT, "
				+ "DECODE(AC_TYPE,'1','예금','2','적금') AS AC_TYPE FROM USER_AC U, AC_INFO A "
				+ "WHERE U.AC_NUMBER = A.AC_NUMBER AND U.USER_CODE = ? ORDER BY AC_NUMBER DESC";
		
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
</head>

<body>
	<div id="main">
		<div id="head">
			<h1>WJ BANK - 우주 은행</h1>
		</div>
		<div id="body">
			<h2 id="soge">확인하실 계좌를 선택해주세요</h2>
			<form action="List_2.jsp" method="post" id="center">
				<select name="AC_NUMBER" id="text_2">
					<option value="">계좌선택</option>
						<%
							while (rs.next()) {
								int AC_NUMBER = rs.getInt("AC_NUMBER");
								int HOLDING_AMOUNT = rs.getInt("HOLDING_AMOUNT");
								String AC_TYPE = rs.getString("AC_TYPE");
						%>
						<option value="<%=AC_NUMBER%>"><%=AC_TYPE %> : <%=AC_NUMBER%> (잔액:<%=HOLDING_AMOUNT%>)</option>
						<%
							}
						%>
				</select>
				<input id="button_2" type="submit" value="확인"> 
			</form>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>
<%
	}catch (Exception e) {
		out.println("<script>alert('[Erorr]관리자에게 문의바랍니다.');window.location.href='./index.jsp'</script>");
		//response.sendRedirect("./index.jsp");
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
%>