<%@page import="VO.UserInfoVO"%>
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
		BankDAO dao = new BankDAO();
		String pw = dao.getPassword(USER_CODE);
		String pw_1 = request.getParameter("pw_1");
		UserInfoVO vo = dao.getUserInfo(USER_CODE);
		if(pw.equals(pw_1)==false) {
			out.println("<script>alert('[Erorr]비밀번호가 일치하지 않습니다.');window.location.href='./index.jsp';</script>");
		}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>WJ Bank - 우주 은행</title>
    <link rel="stylesheet" type="text/css" href="css/css.css?after">
    <script type="text/javascript" src="script/Check.js"></script>
</head>

<body>
    <div id="main">
        <div id="head">
            <h1>WJ BANK - 우주 은행</h1>
        </div>
        <div id="body">
        <h2  id="soge">아이디/비번 수정</h2>
            <form action="Member_Modification_2.jsp" method="post" id="center" onsubmit="return Check_value_update()">
				<p><input class="input_3" id="id" type="text" name="id" placeholder="아이디" value="<%=vo.getID()%>"></p>
				<p><input class="input_3" id="pw_1" type="password" name="pw_1" placeholder="비밀번호" value="<%=vo.getPW()%>"></p>
				<p><input class="input_3" id="pw_2" type="password" name="pw_2" placeholder="비밀번호 확인" value="<%=vo.getPW()%>"></p>
				<input id="button_2" type="submit" value="수정">
			</form>
        </div>
        <div id="footer">
            <h1>footer</h1>
        </div>
    </div>
</body></html>
<%
	}catch (Exception e) {
			out.println("<script>alert('[Erorr]관리자에게 문의바랍니다.');window.location.href='./index.jsp'</script>");
			//response.sendRedirect("./index.jsp");
	}
%>