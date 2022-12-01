<%@page import="java.sql.*"%>
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
			<h2 id="soge">상품가입</h2>
			<form action="product_2.jsp" method="post" id="center">
			<select name="type" id="text_2">
				<option value="0">상품선택</option>
					<option value="1">예금</option>
					<option value="2">적금</option>
				</select>
				<br>
				<input id="button_2" type="submit" value="가입하기">
			</form>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>