function Check_value_join() {
	if(document.getElementById("name").value=="") {
		alert("성함이 입력되지 않았습니다.");
		document.getElementById("name").focus();
		return false;
	}
	if(document.getElementById("id").value=="") {
		alert("아이디가 입력되지 않았습니다.");
		document.getElementById("id").focus();
		return false;
	}
	if(document.getElementById("pw_1").value=="") {
		alert("비밀번호가 입력되지 않았습니다.");
		document.getElementById("pw_1").focus();
		return false;
	}
	if(document.getElementById("pw_2").value=="") {
		alert("비밀번호 확인이 입력되지 않았습니다.");
		document.getElementById("pw_2").focus();
		return false;
	}
	if(document.getElementById("date_").value=="") {
		alert("날짜가 입력되지 않았습니다.");
		document.getElementById("date_").focus();
		return false;
	}
}

function Check_value_update() {
	if(document.getElementById("id").value=="") {
		alert("아이디가 입력되지 않았습니다.");
		document.getElementById("id").focus();
		return false;
	}
	if(document.getElementById("pw_1").value=="") {
		alert("비밀번호가 입력되지 않았습니다.");
		document.getElementById("pw_1").focus();
		return false;
	}
	if(document.getElementById("pw_2").value=="") {
		alert("비밀번호 확인이 입력되지 않았습니다.");
		document.getElementById("pw_2").focus();
		return false;
	}
}

function Check_value_login() {
		if(document.getElementById("id").value=="") {
			alert("아이디가 입력되지 않았습니다.");
			document.getElementById("id").focus();
			return false;
		}
		if(document.getElementById("pw").value=="") {
			alert("비밀번호가 입력되지 않았습니다.");
			document.getElementById("pw").focus();
			return false;
		}
	}