<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WJ Bank - 우주 은행</title>
<link rel="stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript" src="script/Check.js"></script>
</head>

<body>
	<div id="main">
		<div id="head">
			<h1>WJ BANK - 우주 은행</h1>
		</div>
		<div id="body">
			<h1>로그인</h1>
			<form action="Login_2.jsp" method="post"  id="center" onsubmit="return Check_value_login()">
				<input class="text" id="id" type="text" name="id" placeholder="아이디">
				<br>
				<input class="text" id="pw" type="password" name="pw" placeholder="비밀번호">
				<br><br>
				<input id="button_2" type="submit" value="로그인">
			</form>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>