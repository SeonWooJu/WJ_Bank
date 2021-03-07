<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WJ Bank - 우주 은행</title>
    <link rel="stylesheet" type="text/css" href="css/css.css?after">
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
    <div id="main">
        <div id="head">
            <h1>WJ BANK - 우주 은행</h1>
        </div>
        <div id="body">
            <form action="join_2.jsp" method="post">
            	<p><input id="input" type="text" name="name" placeholder="이름"></p>
				<p><input id="input" type="text" name="id" placeholder="아이디"></p>
				<p><input id="input" type="password" name="pw_1" placeholder="비밀번호"></p>
				<p><input id="input" type="password" name="pw_2" placeholder="비밀번호 확인"></p>
				<p><input id="input_2" type="date" name="date_"></p>
				<input id="button_2" type="submit" value="회원가입">
			</form>
        </div>
        <div id="footer">
            <h1>footer임</h1>
        </div>
    </div>
</body></html>