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
}

.content {
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  background: skyblue;
}

.btn {
  width: 200px;
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
function fnOauthAccount(){
	var $authorizeFrm = $('#authorizeFrm');
	$authorizeFrm.submit();
}
</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			Oauth2 토큰 발급 결과
			<br/>
			code : <c:out value='${param.code}' /><br/>
			access_token : <c:out value='${param.access_token}' /><br/>
			refresh_token : <c:out value='${param.refresh_token}' /><br/>
			user_seq_no : <c:out value='${param.user_seq_no}' /><br/><br/>
			<button id="testOauth2" class="btn" onclick="fnOauthAccount()">Oauth2 등록계좌확인</button>
		</div>
	</div>
<form id="authorizeFrm" name="authorizeFrm" method="get" action="https://testapi.openbanking.or.kr/oauth/2.0/authorize_account">
    <input type="hidden" name="client_id" id="client_id" value="4fd50798-dcaa-4ea3-8f11-afce2029527f"/>
    <input type="hidden" name="scope" id="scope" value="login inquiry transfer"/>
    <input type="hidden" name="redirect_uri" id="redirect_uri" value="http://localhost:8080/oauth2/callback"/>
    <input type="hidden" name="auth_type" id="auth_type" value="0"/>
    <input type="hidden" name="response_type" id="response_type" value="code"/>
    <input type="hidden" name="state" id="state" value="12345678901234567890123456789012"/>
</form>
</body>
</html>