<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--link rel="stylesheet" type="text/css" href="/css/main.css" media="screen" /-->
<title>Kakaocert SDK jsp Example.</title>
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

.small_btn {
  width: 100px;
  height: 30px;
  font-size:13px;
  font-family: 'Nanum Gothic';
  color: black;
  text-align: center;
  background: #CCCCCC;
  border: solid 2px grey;
  border-radius: 12px;
}

table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
	font-size: 13px;
}
th, td {
	border: 1px solid #444444;
}
</style>

<%@ include file="common.jsp" %>

<%@page import="com.kakaocert.api.verifyauth.RequestVerifyAuth"%>
<%@page import="com.kakaocert.api.KakaocertException"%>

<script type="text/javascript">

	// 인증요청
	function requestRecvId() {
		
		var name     = document.getElementById('name'       ).value;
		var birthDay = document.getElementById('birthDay'   ).value;
		var phoneNum = document.getElementById('phoneNum'   ).value;
		
		if ( name == '' ) {
			alert("이름을 입력하세요.");
			return false;
		}
		
		if ( birthDay == '' ) {
			alert("생년월일을 입력하세요.");
			return false;
		}
		if (!isBirthday(birthDay)) {
			alert("유효한 생년월일 값이 아닙니다.\r\n확인 후 다시 입력해주세요.");
			return false;
		}		
		
		if ( phoneNum == '' ) {
			alert("핸드폰번호를 입력하세요.");
			return false;
		}
		//if (!isPhoneNumber(phoneNum)) {
		//	alert("유효한 핸드폰번호가 아닙니다.\r\n확인 후 다시 입력해주세요.");
		//	return false;
		//}
	
		var frm = document.getElementById('frm');
		frm.method = 'post';
		frm.action = '/requestVerifyAuth';
	}

	// 숫자입력폼 maxlengh 체크
	function maxLengthCheck(object) {
	    if (object.value.length > object.maxLength){
	        object.value = object.value.slice(0, object.maxLength);
	    }    
	}
	
	// 생년월일 유효성 검사
	function isBirthday(dateStr) {
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 연도 가져옴
		if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
			if (1900 > year || year > yearNow) {
				return false;
			} else if (month < 1 || month > 12) {
				return false;
			} else if (day < 1 || day > 31) {
				return false;
			} else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
				return false;
			} else if (month == 2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if (day>29 || (day==29 && !isleap)) {
					return false;
				} else {
					return true;
				} //end of if (day>29 || (day==29 && !isleap))
			} else {
				return true;
			}//end of if
		} else {
			//1.입력된 생년월일이 8자 초과할때 : auth:false
			return false; 
		}
	}
	
	// 휴대폰 유효성 검사
	function isPhoneNumber(phoneNum) {		
		var regPhone = /(^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
		
		if(!regPhone.test(phoneNum)){		
			return false;
		}
	}
	
	/*
	function requestRecvID() {
		var newForm = document.createElement('form'); //고객정보 파라미터를 보내줄 폼 생성
		newForm.name = 'newForm';
		newForm.method = 'post';
		newForm.action = '/requestVerifyAuth';
		
		var birthDay = document.createElement('input'); //고객정보를 담을 input태그 생성
		var phoneNum = document.createElement('input');
		var name = document.createElement('input');
		var requestMsg = document.createElement('input');
		
		birthDay.setAttribute("type", "hidden"); // 생일정보 담기
		birthDay.setAttribute("name", "birthDay");
		birthDay.setAttribute("value", document.getElementById('birth').value);
		
		phoneNum.setAttribute("type", "hidden"); // 전화번호 담기
		phoneNum.setAttribute("name", "phoneNum");
		phoneNum.setAttribute("value", document.getElementById('phone').value);
		
		name.setAttribute("type", "hidden"); // 이름 담기
		name.setAttribute("name", "name");
		name.setAttribute("value", document.getElementById('name').value);
		
		requestMsg.setAttribute("type", "hidden"); // 요청멧지 담기
		requestMsg.setAttribute("name", "requestMsg");
		requestMsg.setAttribute("value", document.getElementById('msg').value);
		
		newForm.appendChild(birthDay); //폼테그 안으로 삽임함
		newForm.appendChild(phoneNum);
		newForm.appendChild(name);
		newForm.appendChild(requestMsg);
		
		document.body.appendChild(newForm); //폼테그를 body태그 안으로 삽임함
		newForm.submit(); // 폼 전송
	}
	*/

</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			<span style="font-size: 20px;">카카오 인증을 위한 개인정보 입력</span>
			<div style="margin-top: 10px;">
				<form id="frm" method="post">
					<input type="hidden" name="clientCode" id="clientCode" value="021010000014" />
					<table border="1">
					<colgroup>	
				        <col width="40%">
				        <col width="*">
		    		</colgroup>
		    		<tbody>
		    		<tr>
		    			<td>성명</td>
		    			<td><input type="text" name="name" id="name" value="" style="width:100%;" /></td>
		    		</tr>
		    		<tr>
		    			<td>생년월일</td>
		    			<td>
		    				<input type="number" name="birthDay" id="birthDay" value="" style="width:100%;" maxlength="8" oninput="maxLengthCheck(this)" />
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>휴대폰번호</td>
		    			<td><input type="number" name="phoneNum" id="phoneNum" value="" style="width:100%;" maxlength="11" oninput="maxLengthCheck(this)" /></td>
		    		</tr>
		    		<tr>
		    			<td>인증요청부가메세지</td>
		    			<td><input type="text" name="requestMsg" id="requestMsg" value="인증요청 테스트" style="width:100%;" /></td>
		    		</tr>
		    		</tbody>				
					</table>
					<div align="right" style="margin-top: 5px;">
						<button class="small_btn" onclick="requestRecvId();">인증요청</button>
					</div>
				</form>
			</div>
		 </div>
	</div>
</body>

</html>