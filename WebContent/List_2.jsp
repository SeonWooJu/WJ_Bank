<%@page import="DB.DBConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	int AC_NUMBER = 0;
	String sql = "";
	try{
		int count = 0;
		try{
			AC_NUMBER = Integer.parseInt(request.getParameter("AC_NUMBER"));
		} catch (Exception e) {
			out.println("<script>alert('[Erorr]계좌를 선택해 주시기 바랍니다.');history.go(-1);</script>");
			//response.sendRedirect("./index.jsp");
		}
		try {
			conn = DBConnection.getConnection();
		
			sql = "SELECT * FROM AC_TRADE WHERE AC_NUMBER_IN = ? OR AC_NUMBER_OUT = ? ORDER BY TRANSACTION_NUMBER DESC";
		
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, AC_NUMBER);
			stmt.setInt(2, AC_NUMBER);
		
			rs = stmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WJ Bank - 우주 은행</title>
<link rel="stylesheet" type="text/css" href="css/css.css?after">
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
						<td class="table_list"><%=TRANSACTION_TIME%></td>
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
			<a href="./index.jsp" class="button">처음으로</a>
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