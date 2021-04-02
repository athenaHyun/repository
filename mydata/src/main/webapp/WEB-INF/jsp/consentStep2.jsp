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
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  background: #EEEEEE;
}

.btn {
  width: 150px;
  height: 50px;
  font-size:15px;
  font-family: 'Nanum Gothic';
  color: black;
  text-align: center;
  background: #CCCCCC;
  border: solid 2px grey;
  border-radius: 12px;
}
</style>
<title>개인신용정보 전송요구 동의</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			<span style="font-size: 20px;">개인신용정보 전송요구 동의</span><br/>
			<span style="font-size: 15px;">1. 전송요구동의 > <b>2.본인인증</b> > 3.자산목록선택</span><br/>			
			<span style="font-size: 12px;">본인인증 방법을 선택해 주세요.</span>
			<div align="center" style="margin-top: 10px;">				
				<button class="btn" onclick='javascript:location.href="/cusInform";'>카카오페이 인증</button>
			</div>
		</div>
	</div>
</body>
</html>