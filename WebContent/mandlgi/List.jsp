<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ResultSet rs = null;
	PreparedStatement stmt = null;
	String sql = "";
	int count = 0;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdb:oracle:thin:@localhost:1521:system";
	String id = "test20509";
	String pw = "20509";
	Connection conn = DriverManager.getConnection(url, id, pw);
	
	sql = "SELECT * FROM AC_TRADE WHERE AC_NUMBER_IN = '110-001' ORDER BY TRANSACTION_NUMBER DESC";
	
	stmt = conn.prepareStatement(sql);
	
	rs = stmt.executeQuery();
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
            <table>
            	<thead>
            		<tr>
            			<th>거래 시간</th><th>받은 계좌</th><th>금액</th>
            		</tr>
            	</thead>
            	<tbody>
            		<%
            			while (rs.next() && count <= 4) {
            				
            			}
            		%>
            		<tr>
            			<td></td><td></td><td></td>
            		</tr>
            	</tbody>
            </table>
        </div>
        <div id="footer">
            <h1>footer임</h1>
        </div>
    </div>
</body></html>