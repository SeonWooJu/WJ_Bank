<%@page import="DAO.BankDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	try{
		int USER_CODE = 0;
		int AC_NUMBER = 0;
		try {
			USER_CODE = (Integer) session.getAttribute("user_code");
		} catch (Exception e) {
			out.println("<script>alert('[Erorr]로그인 후 이용가능한 서비스입니다.');window.location.href='./index.jsp'</script>");
		}
		
		int type = Integer.parseInt(request.getParameter("type"));
		
		if(type==0) {
			out.println("<script>alert('[Erorr]상품을 선택해주시기 바랍니다.');window.location.href='./index.jsp'</script>");
		}else{
			BankDAO dao = new BankDAO();
			AC_NUMBER = dao.makeAccount(type, USER_CODE);
		}
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
			<h2><%=USER_CODE%>님의 계좌가 개설되었습니다
			</h2>
			<h2>
				계좌번호 : <%=AC_NUMBER%>
			</h2>
			<h2></h2>
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
	}
%>