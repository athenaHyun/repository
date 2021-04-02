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
			<span style="font-size: 15px;"><b>1. 전송요구동의</b> > 2.본인인증 > 3.자산목록선택</span><br/>			
			<div style="line-height: 200%; margin-top: 10px; font-size: 13px;">
				개인신용정보 전송을 위해서는 정보주체의 동의가 필요합니다.<br/>
				[○○보험 귀중]<br/>
				본인은 ○○보험(이하 '회사'라 합니다)에	<br/>
				신용정보의 이용 및 보호에 관란 법률 제33조2」에 따라 회사가 관리하고 있는<br/>
				본인의 개인신용정보를 본인이 지정한 '마이데이터 사업자'에게 전송하여 주는 것에 동의합니다.<br/>
				1. 전송항목<br/>
				2. 고지사항<br/>
			</div>
			<div align="center" style="margin-top: 10px;">
				<button class="btn" style="font-size: 12px;" onclick='javascript:location.href="/consentStep2";'>전송동의</button>
				<button class="btn" style="font-size: 12px;" onclick='javascript:location.href="/member/detail";'>본인동의회원정보관리</button>
			</div>
		</div>
	</div>
<form id="authorizeFrm" name="authorizeFrm" method="get">
</form>
</body>
</html>