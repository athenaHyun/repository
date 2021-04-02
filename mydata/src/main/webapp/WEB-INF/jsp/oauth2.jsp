<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
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
  text-align: center;
}

.content {
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  background: skyblue;
}

.btn {
  width: 160px;
  height: 50px;
  font-size:15px;
  font-family: 'Nanum Gothic';
  color: black;
  text-align: center;
  background: sky;
  border: solid 2px grey;
  border-radius: 12px;
}
</style>
<title>Insert title here</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">
	function fnOauth(){
		var $authorizeFrm = $('#authorizeFrm');
		window.open('', '_authForm');
		$authorizeFrm.submit();
	}
</script>
</head>
<body>
<form id="authorizeFrm" name="authorizeFrm" method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" target="_authForm">
	<div class="wrapper">
		<div class="content" style="text-align: left;">
			<div style="text-align: center;">Oauth2 사용자 인증</div>
			response_type : <input type="text" name="response_type" id="response_type" style="width:300px; float:right; margin-top:15px;" value="code"/>
			<br/>
			client_id : <input type="text" name="client_id" id="client_id" style="width:300px; float:right; margin-top:15px;" value="4fd50798-dcaa-4ea3-8f11-afce2029527f"/>
			<br/>
			redirect_uri : <input type="text" name="redirect_uri" id="redirect_uri" style="width:300px; float:right; margin-top:15px;" value="http://localhost:8080/oauth2/callback/auth"/>
			<br/>
			scope : <input type="text" name="scope" id="scope" style="width:300px; float:right; margin-top:15px;" value="login inquiry transfer"/>
			<br/>
			state : <input type="text" name="state" id="state" style="width:300px; float:right; margin-top:15px;" value="12345678901234567890123456789012"/>
			<br/>
			<button id="testOauth2" class="btn" type="button" style="text-align: center;margin-left: 200px;" onclick="fnOauth()">Oauth2 사용자 인증</button>
		</div>
	</div>
</form>
</body>
</html>