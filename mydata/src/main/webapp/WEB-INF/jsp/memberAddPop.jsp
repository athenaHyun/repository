<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 95vh;
  background: white;
}

.content {
  font-family: system-ui, serif;
  font-size: 1rem;
  padding: 3rem;
  border-radius: 1rem;
  background: lightgrey;
}

.btn {
  width: 150px;
  height: 50px;
  font-size:15px;
  font-family: 'Nanum Gothic';
  color: black;
  text-align: center;
  background: sky;
  border: solid 2px grey;
  border-radius: 12px;
}
table tr td {
	font-size:0.7em;
}
th {
	font-size:0.7em;
}
</style>
<title>회원추가</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">
	function memberAdd() {
		if ( $('#clientId').val() == '' || $('#clientId').val() == null ) {
			alert("clientId는 필수 입력값입니다.");
			return false;
		}
		//alert(addFrm);
		document.addFrm.action = "/member/add";
		document.addFrm.submit();
		//window.close();
	}
</script>
</head>
<body>
<div class="wrapper">
	<div class="content">
		<form name="addFrm" id="addFrm" method="post">
			<p style="font-style:bold;">회원정보 입력</p>
			
				ClientId(필수): <input name="clientId" id="clientId" type="text" />
				<br/><br/>
				생일: <input name="birth" id="birth" type="text" />
				<br/><br/>
				이름: <input name="name" id="name" type="text" />
				<br/><br/>
				휴대폰번호: <input name="hp" id="hp" type="text" />
				<br/><br/>
			
				<div align="center" style="margin-top: 10px;">				
					<button class="btn" onclick='javascript:memberAdd();'>추가</button>
				</div>
		</form>
	</div>
</div>
</body>
</html>