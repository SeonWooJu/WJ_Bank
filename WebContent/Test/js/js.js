var request = new XMLHttpRequest();
	function inquiry() {
		request.open("Post", "./UserSearchServlet?AC_NUMBER="+encodeURIComponent("20501"), true);
		request.onreadystatechange = searchProcess;
		//request.send(null);
	} 
	function searchProcess() {
		var table = document.getElementById("money");
		table.innerHTML = "";
		if(request.readyState == 4 && request.status == 200){
			var object = eval('(' + request.responseText + ')');
			var result = object.resul;
			for(var i = 0; i < result.length; i++){
				var row = table.insertRow(0);
				for(var j = 0; j < result[i].length; j++){
					var cell = row.insertCell(j);
					cell.innerHTML = result[i][j].value;
				}
			}
		}
	}