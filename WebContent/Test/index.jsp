<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WJ Bank - 우주 은행</title>
<link rel="stylesheet" type="text/css" href="css/css.css">
<script type="text/javascript">
	var request = new XMLHttpRequest();
	function inquiry() {
		request.open("Post", "./UserSearchServlet?Name="encodeURIComponent("20501"),true);
		request.onreadystatechange = searchProcess;
		request.send(null);
	}
	function searchProcess() {
		var table = document.getElementById("money");
		table.innerHTML = "";
		if (request.readyState == 4 && request.status == 200) {
			var object = eval('(' + request.responseText + ')');
			var result = object.result;
			for (var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
				for (var j = 0; j < result[i].length; j++) {
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}
</script>
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
					<li><a href="">이체</a></li>
					<li class="solid"></li>
					<li><a href="">예금가입</a></li>
					<li class="solid"></li>
					<li><a href="">거래내역</a></li>
					<li class="solid"></li>
				</ul>
			</div>
			<div id="body_center">
				<div>
					<h2 id="money">원</h2>
				</div>
				<p id="button" onclick="inquiry()">금액조회</p>
			</div>
			<div id="body_right">
				<ul>
					<li class="solid"></li>
					<li><a href="">로그인</a></li>
					<li class="solid"></li>
					<li><a href="">회원가입</a></li>
					<li class="solid"></li>
					<li><a href="">이용안내</a></li>
					<li class="solid"></li>
				</ul>
			</div>
		</div>
		<div id="footer">
			<h1>footer임</h1>
		</div>
	</div>
</body>
</html>