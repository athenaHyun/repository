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

	function fnAccountList(apiUrl){
		var rmKey = Math.floor(Math.random() * 100000000) + 1;
		var cvKey;
		cvKey = rpad(rmKey, 9);
		var randomNum = "M202111253U" + cvKey;
		$('#bank_tran_id').val(randomNum);
		$('#from_date').val(getFirstday());
		$('#to_date').val(getToday());
		$('#tran_dtime').val(getDate());
		$('#strParam').val('');
		$('#apiUrl').val(apiUrl);
		var strParam = $("#authorizeFrm").serialize();
		$('#strParam').val('?' + strParam);
	    $.ajax({
	        type : "POST",
	        dataType : 'json',
	        data : $("#authorizeFrm").serialize(),
	        url : "/apiCallProc",
	        success : function(result) {
	        	$('#divResultBody').html(JSON.stringify(result.data).split(',').join(',<br/>'));
	        }
	    });
	}
	
	
	/*
	 *   YYYYMMDDHHMMSS
	 *   형식으로 날짜를 리턴한다.
	 */
	function getDate(){
		var currentdate = new Date(); 
		var rst = pad(  currentdate.getFullYear() , 2 ) 
		+	pad(  (currentdate.getMonth()+1)  , 2 ) 
		+	pad( currentdate.getDate() , 2 ) 
		+	pad(  currentdate.getHours() , 2 )   
		+	pad(  currentdate.getMinutes() , 2 )
		+	pad(  currentdate.getSeconds() , 2 ) ; 
		return rst;
	}

	function getFirstday(){
		var currentdate = new Date(); 
		var rst = pad(  currentdate.getFullYear() , 2 ) 
		+	pad(  (currentdate.getMonth()+1)  , 2 ) 
		+	'01' ;
		return rst;
	}
	
	function getToday(){
		var currentdate = new Date(); 
		var rst = pad(  currentdate.getFullYear() , 2 ) 
		+	pad(  (currentdate.getMonth()+1)  , 2 ) 
		+	pad( currentdate.getDate() , 2 ) ;
		return rst;
	}
	
	function pad(number, length) {
		var str = '' + number;
		while (str.length < length) {
		    str = '0' + str;
		}
		return str;
	}
	
	function rpad(number, length) {
		var str = '' + number;
		while (str.length < length) {
		    str = str + '0';
		}
		return str;
	}
</script>
</head>
<body>
<form id="authorizeFrm" name="authorizeFrm" method="get" target="_authForm">
<div class="wrapper">
	<div class="content">
		<div style="text-align: center; height: 0px;">API CALL</div>
		<br/>
		user_seq_no : <input type="text" name="user_seq_no" id="user_seq_no" style="width:300px;" value="1100768865"/>
		<br/>
		fintech_use_num : <input type="text" name="fintech_use_num" id="fintech_use_num" style="width:300px;" value=""/>
		<br/>
		Authorization : <input type="text" name="Authorization" id="Authorization" style="width:300px;" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAwNzY4ODY1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2MTk1MTExODcsImp0aSI6IjA3YmMwNjcyLWY2NjYtNDJhMS05NDZjLTljMDc0MDM0ZTBlNiJ9.xR6-ytzD53i0Oq8SczzQDDe7WA4Z8VtXkan1SxHsOeI"/>
		<br/>
		<button id="testOauth2" class="btn" type="button" onclick="fnAccountList('user/me')">사용자정보조회</button>
		<button id="testOauth2" class="btn" type="button" onclick="fnAccountList('account/list')">등록계좌조회</button>
		<button id="testOauth2" class="btn" type="button" onclick="fnAccountList('account/balance/fin_num')">잔액조회</button>
		<button id="testOauth2" class="btn" type="button" onclick="fnAccountList('account/transaction_list/fin_num')">거래내역</button>
	</div>
</div>
<div style="margin-top: -200px;text-align: center;">
	<br/>조회 결과<br/>
	<p id="divResultBody" style="height: 0px;"></p>
</div>
    <input type="hidden" name="include_cancel_yn" id="include_cancel_yn" value="Y"/>
    <input type="hidden" name="sort_order" id="sort_order" value="D"/>
    <input type="hidden" name="bank_tran_id" id="bank_tran_id" value=""/>
<!--     <input type="hidden" name="fintech_use_num" id="fintech_use_num" value="120211125388932191322356"/> -->
    <input type="hidden" name="tran_dtime" id="tran_dtime" value=""/>
    <input type="hidden" name="inquiry_type" id="inquiry_type" value="A"/>
    <input type="hidden" name="inquiry_base" id="inquiry_base" value="D"/>
    <input type="hidden" name="from_date" id="from_date" value=""/>
    <input type="hidden" name="to_date" id="to_date" value=""/>
    <input type="hidden" name="apiUrl" id="apiUrl" value="D"/>
    <input type="hidden" name="strParam" id="strParam" value=""/>
</form>
</body>
</html>