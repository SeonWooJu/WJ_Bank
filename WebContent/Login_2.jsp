<%@page import="DAO.BankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try{
	    String id = request.getParameter("id");
	    String pw = request.getParameter("pw");
	    
	    BankDAO dao = new BankDAO();
	    int USER_CODE = dao.memberLogin(id,pw);
	    
		if(USER_CODE == 0) {
			out.println("<script>alert('아이디/비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
		}else{
			session.setAttribute("user_code", USER_CODE);
			response.sendRedirect("./index.jsp");
		}
	}catch (Exception e) {
		out.println("<script>alert('[Erorr]관리자에게 문의바랍니다.');window.location.href='./index.jsp'</script>");
		//response.sendRedirect("./index.jsp");
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