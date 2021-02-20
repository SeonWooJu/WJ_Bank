<%@page import="transfer.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ac2 = request.getParameter("ac2");
	int num = Integer.parseInt(request.getParameter("num"));
	String ac1 = request.getParameter("ac1");
	user u = new user(ac1,ac2,num);
	u.DB();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WJ Bank - 우주 은행</title>
    <link rel="stylesheet" type="text/css" href="css/css.css">
    <script type="text/javascript" src="js/js.js"></script>
</head>

<body>
    <div id="main">
        <div id="head">
            <h1>WJ BANK - 우주 은행</h1>
        </div>
        <div id="body">
           <h2><%=ac1 %>님 계좌에서 <%=ac2 %>님 계좌로</h2>
           <h2><%=num %>원</h2>
           <h2>이 송금되었습니다.</h2>
           <a href="./index.jsp"><p id="button">금액조회</p></a>
        </div>
        <div id="footer">
            <h1>footer</h1>
        </div>
    </div>
</body></html>