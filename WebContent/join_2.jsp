<%@page import="DAO.BankDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = null;
	try{
	    request.setCharacterEncoding("UTF-8");
	    name = request.getParameter("name");
		String id = request.getParameter("id");
	    String pw_1 = request.getParameter("pw_1");
	    String pw_2 = request.getParameter("pw_2");
	    String date = request.getParameter("date_");
	    if(pw_1.equals(pw_2)){
	    	BankDAO dao = new BankDAO();
	    	dao.joinMembership(name, date, id, pw_1);
	    }else{
	    	out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
	    }
	}catch (Exception e) {
		out.println("<script>alert('[Erorr]관리자에게 문의바랍니다.');window.location.href='./index.jsp'</script>");
		//response.sendRedirect("./index.jsp");
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
			<h2><%=name%>님 안녕하세요.
			</h2>
			<h2>회원가입이 완료 되셨습니다.
			</h2>
			<h2> </h2>
			<a href="./index.jsp" id="button">처음으로</a>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>