<%@page import="DAO.BankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int USER_CODE = 0;
	try {
		USER_CODE = (Integer) session.getAttribute("user_code");
	} catch (Exception e) {
		out.println("<script>alert('[Erorr]로그인 후 이용가능한 서비스입니다.');window.location.href='./index.jsp'</script>");
		//response.sendRedirect("./index.jsp");
	}
%>

<!DOCTYPE html>
<html>
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
        <h2>비밀번호 확인</h2>
      	<form action="Member_Modification.jsp" method="post" id="center">
			<p><input id="text" id="pw_1" type="password" name="pw_1" placeholder="비밀번호"></p>
			<input id="button_2" type="submit" value="수정">
		</form>
        </div>
        <div id="footer">
            <h1>footer</h1>
        </div>
    </div>
</body></html>