<%@page import="DAO.BankDAO"%>
<%@page import="DB.DBConnection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int USER_CODE = 0;
	String mm = "";
	String logoin1 = "";
	String logoin2 = "";
	String logoin3 = "";
	String logoin4 = "";
	try{
		try {
			USER_CODE = (Integer) session.getAttribute("user_code");
		} catch (Exception e) {
			USER_CODE = 0;
		}
		if(USER_CODE == 0){
			mm = "로그인 후 조회 가능합니다";
			logoin1 = "./Login.jsp";
			logoin2 = "로그인";
			logoin3 = "./join.jsp";
			logoin4 = "회원가입";
		}else {
			BankDAO dao = new BankDAO();
			mm = dao.getAllMoney(USER_CODE)+"원";
			logoin1 = "./logout.jsp";
			logoin2 = "로그아웃";
			logoin3 = "./Ch_Member_Modification.jsp";
			logoin4 = "회원수정";
		}
	} catch (Exception e) {
		e.printStackTrace();
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
			<div id="body_left">
				<ul>
					<li class="solid"></li>
					<li><a href="./transfer.jsp">이체</a></li>
					<li class="solid"></li>
					<li><a href="./product.jsp">상품가입</a></li>
					<li class="solid"></li>
					<li><a href="./List.jsp">MY계좌</a></li>
					<li class="solid"></li>
				</ul>
			</div>
			<div id="body_center">
				<div>
					<h2 id="money"><%=mm%>
					</h2>
				</div>
				<p id="button" onclick="history.go(0)">총합조회</p>
			</div>
			<div id="body_right">
				<ul>
					<li class="solid"></li>
					<li><a href="<%=logoin1 %>"><%=logoin2 %></a></li>
					<li class="solid"></li>
					<li><a href="<%=logoin3 %>"><%=logoin4 %></a></li>
					<li class="solid"></li>
					<li><a href="./inquiry.jsp">문의</a></li>
					<li class="solid"></li>
				</ul>
			</div>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>