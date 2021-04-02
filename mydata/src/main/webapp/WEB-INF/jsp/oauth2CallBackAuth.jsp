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
// 	var $authorizeFrm = $('#authorizeFrm');
// 	$authorizeFrm.submit();
	
	$.ajax({
        type : "POST",
        dataType : 'json',
        data : $("#authorizeFrm").serialize(),
        url : "/oauth2TokenProc",
        success : function(result) {
        	$('#oauth2Result').show();
        	$('#access_token').val(result.data.access_token);
        	$('#user_seq_no').val(result.data.user_seq_no);
        	$('#token_type').val(result.data.token_type);
        	$('#refresh_token').val(result.data.refresh_token);
        	$('#scope').val(result.data.scope);
        	$('#expires_in').val(result.data.expires_in);
        	if(result.data.rsp_code == 'O0001'){
        		$('#oauth2Result').hide();
        		$('#oauth2ResultFail').show();
        		$('#failResukt').html(result.data.rsp_code + ' : ' + result.data.rsp_message);
        	}
        }
    });
// 	oauth2TokenProc
	
}
</script>
</head>
<body>
<form id="authorizeFrm" name="authorizeFrm">
	<div class="wrapper">
		<div class="content" style="text-align: left;">
			Oauth2 사용자 인증 결과
			<br/>code : <input type="text" name="code" id="code" style="width:300px;float:right; margin-top:15px;" value="${param.code}"/>
			<br/>
			<button id="testOauth2" class="btn" style="margin-left: 150px;" onclick="fnOauthAccount()" type="button">Oauth2 token발급</button>
			<br/><span style="font-size: 21px;">(https://testapi.openbanking.or.kr/oauth/2.0/token)</span>
			<br/>client_id : <input type="text" name="client_id" id="client_id" style="width:300px;float:right; margin-top:15px;" value="4fd50798-dcaa-4ea3-8f11-afce2029527f"/>
			<br/>client_secret : <input type="text" name="client_secret" id="client_secret" style="width:300px;float:right; margin-top:15px;" value="0d4c2ed7-a9f6-40a5-aca2-6dd7edfc407b"/>
			<br/>redirect_uri : <input type="text" name="redirect_uri" id="redirect_uri" style="width:300px;float:right; margin-top:15px;" value="http://localhost:8080/oauth2/callback/auth"/>
			<br/>grant_type : <input type="text" name="grant_type" id="grant_type" style="width:300px;float:right; margin-top:15px;" value="authorization_code"/>
			
		</div>
	</div>
	<div id="oauth2Result" style="margin-top: -130px;text-align:center; display: none;">
		<br/>Oauth2 토급 발급 결과<br/>
		<br/>access_token : <input type="text" name="access_token" id="access_token" style="width:300px;" value=""/>
		<br/>user_seq_no : <input type="text" name="user_seq_no" id="user_seq_no" style="width:300px;" value=""/>
		<br/>token_type : <input type="text" name="token_type" id="token_type" style="width:300px;" value=""/>
		<br/>refresh_token : <input type="text" name="refresh_token" id="refresh_token" style="width:300px;" value=""/>
		<br/>scope : <input type="text" name="scope" id="scope" style="width:300px;" value=""/>
		<br/>expires_in : <input type="text" name="expires_in" id="expires_in" style="width:300px;" value=""/>
	</div>
	<div id="oauth2ResultFail" style="margin-top: -130px;text-align: center; display: none;">
		<br/>Oauth2 토급 발급 결과<br/>
		<br/><p id="failResukt" style="height: 0px;"></p>
	</div>
</form>
</body>
</html>