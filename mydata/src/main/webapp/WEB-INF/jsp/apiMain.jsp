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
</style>
<title>Insert title here</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			오픈뱅킹 api 메인
			<br/><br/>
			<button class="btn" onclick='javascript:location.href="/oauth2";'>Oauth2 인증페이지</button>
			<button class="btn" onclick='javascript:location.href="/apiCall";'>api 테스트페이지</button>
		</div>
	</div>
<form id="authorizeFrm" name="authorizeFrm" method="get">
</form>
</body>
</html>