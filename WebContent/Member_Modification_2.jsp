<%@page import="java.sql.Date"%>
<%@page import="DAO.BankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	try{
		int USER_CODE = 0;
		try {
			USER_CODE = (Integer) session.getAttribute("user_code");
		} catch (Exception e) {
			out.println("<script>alert('[Erorr]로그인 후 이용가능한 서비스입니다.');window.location.href='./index.jsp'</script>");
			//response.sendRedirect("./index.jsp");
		}
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw_1 = request.getParameter("pw_1");
		String pw_2 = request.getParameter("pw_2");
		if (pw_1.equals(pw_2)) {
			BankDAO dao = new BankDAO();
			dao.getMemberUpdate(USER_CODE, id, pw_1);
			out.println("<script>alert('수정 완료');window.location.href='./index.jsp'</script>");
		} else {
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');history.go(-1);</script>");
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
<title>WJ Bank - 우주 은행</title>
</head>
<body>

</body>
</html>