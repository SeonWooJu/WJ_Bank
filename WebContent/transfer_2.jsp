<%@page import="DAO.BankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	int USER_CODE = 0;
	int ac2 = 0;
	int num = 0;
	int ac1 = 0;
	try{
		try {
			USER_CODE = (Integer) session.getAttribute("user_code");
		} catch (Exception e) {
			out.println("<script>alert('[Erorr]로그인 후 이용가능한 서비스입니다.');window.location.href='./index.jsp'</script>");
			//response.sendRedirect("./index.jsp");
		}
		ac2 = Integer.parseInt(request.getParameter("ac2"));
		num = Integer.parseInt(request.getParameter("num"));
		ac1 = Integer.parseInt(request.getParameter("ac1"));
		
		BankDAO dao = new BankDAO();
		if(dao.getMoney(ac1) < num){
			out.println("<script>alert('[Error]계좌의 돈이 송금금액보다 적습니다. ');history.go(-1);</script>");
		}else{
			if(num<=0){
				out.println("<script>alert('[Error]정확한 송금 금액을 입력해주세요. ');history.go(-1);</script>");
			}else{
				dao.moneyTransferring(ac1, ac2, num);
			}
		}
	}catch (Exception e) {
		out.println("<script>alert('[Error]입력 값이 없습니다.');history.go(-1);</script>");
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
			<h2><%=ac1%>님 계좌에서
				<%=ac2%>님 계좌로
			</h2>
			<h2><%=num%>원
			</h2>
			<h2>이 송금되었습니다.</h2>
			<a href="./index.jsp" id="button">처음으로</a>
		</div>
		<div id="footer">
			<h1>footer</h1>
		</div>
	</div>
</body>
</html>