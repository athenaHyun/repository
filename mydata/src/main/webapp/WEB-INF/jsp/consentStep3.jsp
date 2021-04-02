<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"    uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
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
	font-size: 12px;
}
th, td {
	border: 1px solid #444444;
}

#modal {
	display:none;
	z-index:1;
	position: fixed;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}
	
#modal h2 {
	margin: 0;   
}
	
#modal button {
	display:inline-block;
	width:100px;
	// margin-left:calc(100% - 100px - 10px);
}
	
#modal .modal_content {
	width:500px;
	margin:50px auto;
	padding:20px 10px;
	background:#ffffff;
	border:2px solid #666;
}
	
#modal .modal_layer {
	position:fixed;
	top:0;
	left:0;
	width:100% auto;
	height:100% auto;
	background:rgba(0, 0, 0, 0.5);
	z-index:-1;
}
</style>
<title>개인신용정보 전송요구 동의</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">

	
$(document).ready(function() {

	$('#back_btn').submit(function(event) {
		location.href="/consentStep1";
	});
		
	$('#propertyCosentAgreeForm').submit(function(event) {
       
        var consentYn = 'N';
		var consentAgreeYn = 'N';
		var $insuConsentYn = $('input[name=insuConsentYn]');
		var $loanConsentYn = $('input[name=loanConsentYn]');
		var $irpConsentYn = $('input[name=irpConsentYn]');
		if ($insuConsentYn.length) {
			consentYn = 'Y';
		}
		if ($insuConsentYn.length) {
			consentYn = 'Y';
		}
		if ($insuConsentYn.length) {
			consentYn = 'Y';
		}
		
		if (consentYn != 'Y') {
			alert('개인신용정보 전송요구 대상 자산 목록이 존재하지 않습니다.');
			return false;
		}
		
		var insuConsentYnCnt = $("input:checkbox[name=insuConsentYn]:checked").length;
		var loanConsentYnCnt = $("input:checkbox[name=loanConsentYn]:checked").length;
		var irpConsentYnCnt = $("input:checkbox[name=irpConsentYn]:checked").length;
		if (insuConsentYnCnt + loanConsentYnCnt + irpConsentYnCnt == 0) {
			alert('개인신용정보 전송요구 대상 자산 목록을 선택해주세요.');
			if ($insuConsentYn) $insuConsentYn.focus();
			else if ($loanConsentYn) $loanConsentYn.focus();
			else if ($irpConsentYn) $irpConsentYn.focus();
			return false;
		}
		
		var $consentAgreeYn = $('#consentAgreeYn');		
		if (!$consentAgreeYn.is(":checked")) {
			alert('개인신용정보 정기적 전송 동의 사항를 선택해주세요.');
			$consentAgreeYn.focus();
			return false;
		}
	
   	}); // end submit()
   	
   	$('#modalOpenBtn').click(function () {
   	
   		var consentYn = 'N';
		var consentAgreeYn = 'N';
		var $insuConsentYn = $('input[name=insuConsentYn]');
		var $loanConsentYn = $('input[name=loanConsentYn]');
		var $irpConsentYn = $('input[name=irpConsentYn]');
		if ($insuConsentYn.length) {
			consentYn = 'Y';
		}
		if ($irpConsentYn.length) {
			consentYn = 'Y';
		}
		if ($irpConsentYn.length) {
			consentYn = 'Y';
		}
		
		if (consentYn != 'Y') {
			alert('개인신용정보 전송요구 대상 자산 목록이 존재하지 않습니다.');
			return false;
		}
		
		var insuConsentYnCnt = $("input:checkbox[name=insuConsentYn]:checked").length;
		var loanConsentYnCnt = $("input:checkbox[name=loanConsentYn]:checked").length;
		var irpConsentYnCnt = $("input:checkbox[name=irpConsentYn]:checked").length;
		if (insuConsentYnCnt + loanConsentYnCnt + irpConsentYnCnt == 0) {
			alert('개인신용정보 전송요구 대상 자산 목록을 선택해주세요.');
			if ($insuConsentYn) $insuConsentYn.focus();
			else if ($loanConsentYn) $loanConsentYn.focus();
			else if ($irpConsentYn) $irpConsentYn.focus();
			return false;
		}
		
		var $consentAgreeYn = $('#consentAgreeYn');		
		if (!$consentAgreeYn.is(":checked")) {
			alert('개인신용정보 정기적 전송 동의 사항를 선택해주세요.');
			$consentAgreeYn.focus();
			return false;
		}
		
		
		var htmls = '';
		
		// 보험계약
		htmls = '';
		if (insuConsentYnCnt > 0) {
			htmls += '<span style="font-size: 13px;">◆ 보험계약</span>';
			htmls += '<table boder="1">';
			htmls += '<colgroup>';
			htmls += '	<col width="20%">';
			htmls += '	<col width="*">';
			htmls += '</colgroup>';
			htmls += '<thead>';
			htmls += '<tr>';
			htmls += '	<th>증권번호</th>';
			htmls += '	<th>상품명(피보험자)</th>';
			htmls += '</tr>';
			htmls += '</thead>';
			htmls += '<tbody>';
			
			$('input:checkbox[name=insuConsentYn]:checked').each(function(i, elements){
			    //해당 index(순서)값을 가져옵니다.
			    var idx = $(elements).index("input:checkbox[name=insuConsentYn]");
			    
			    htmls += '<tr>';
			    htmls += '	<td>' + $('input:hidden[name=insuInsuNum]').eq(idx).val() + '</td>';
			    htmls += '	<td>';
			    htmls += 		$('input:hidden[name=insuProdName]').eq(idx).val();
			    htmls += ' (' +	$('input:hidden[name=insuInsuredName]').eq(idx).val() + ')';
			    htmls += '	</td>';
			    htmls += '</tr>';
        	});
        	htmls += '</tbody>';
        	htmls += '</table>';
        	$('#modal_content_insu').html(htmls);
		}
		
		// 대출계약
		htmls = '';
		if (loanConsentYnCnt > 0) {
			htmls += '<span style="font-size: 13px;">◆ 대출계약</span>';
			htmls += '<table boder="1">';
			htmls += '<colgroup>';
			htmls += '	<col width="20%">';
			htmls += '	<col width="*">';
			htmls += '</colgroup>';
			htmls += '<thead>';
			htmls += '<tr>';
			htmls += '	<th>계좌번호</th>';
			htmls += '	<th>상상품명(계약일자))</th>';
			htmls += '</tr>';
			htmls += '</thead>';
			htmls += '<tbody>';
			
			$('input:checkbox[name=loanConsentYn]:checked').each(function(i, elements){
			
			    var idx = $(elements).index("input:checkbox[name=loanConsentYn]");
			    
			    htmls += '<tr>';
			    htmls += '	<td>' + $('input:hidden[name=loanAccountNum]').eq(idx).val() + '</td>';
			    htmls += '	<td>';
			    htmls += 		$('input:hidden[name=loanProdName]').eq(idx).val();
			    htmls += ' (' +	$('input:hidden[name=loanLoanStartDate]').eq(idx).val() + ' ~ ';
			    htmls += 		$('input:hidden[name=loanLoanExpDate]').eq(idx).val() + ')';
			    htmls += '	</td>';
			    htmls += '</tr>';
        	});
        	htmls += '</table>';
        	$('#modal_content_loan').html(htmls);
		}
		
		// 개인형IRP
		htmls = '';
		if (irpConsentYnCnt > 0) {
			htmls += '<span style="font-size: 13px;">◆ 개인형IRP</span>';
			htmls += '<table boder="1">';
			htmls += '<colgroup>';
			htmls += '	<col width="20%">';
			htmls += '	<col width="*">';
			htmls += '</colgroup>';
			htmls += '<thead>';
			htmls += '<tr>';
			htmls += '	<th>계좌번호</th>';
			htmls += '	<th>상품명(개설일)</th>';
			htmls += '</tr>';
			htmls += '</thead>';
			htmls += '<tbody>';
			$('input:checkbox[name=irpConsentYn]:checked').each(function(i, elements){
			
			    var idx = $(elements).index("input:checkbox[name=irpConsentYn]");
			    
			    htmls += '<tr>';
			    htmls += '	<td>' + $('input:hidden[name=irpAccountNum]').eq(idx).val() + '</td>';
			    htmls += '	<td>';
			    htmls += 		$('input:hidden[name=irpProdName]').eq(idx).val();
			    htmls += ' (' +	$('input:hidden[name=irpIssueDate]').eq(idx).val() + ')';
			    htmls += '	</td>';
			    htmls += '</tr>';
        	});
        	htmls += '</table>';
        	$('#modal_content_irp').html(htmls);
		}
	   		
	    $('#modal').css("display", "block");
	    
	    
	});
	
	$('#modalCloseBtn').click(function () {
	
		$('input[type=text][name=sendClientId]').remove();
		$('input[type=text][name=sendInsuNum]').remove();
		$('input[type=text][name=sendLoanAccountNum]').remove();
		$('input[type=text][name=sendIrpAccountNum]').remove();
		
	    $('#modal').css("display", "none");
	}); 

	$('#sendBtn').click(function () { $("#propertyCosentAgreeForm").submit(); });
	
	$('#modalSendBtn').click(function () {
	
		$('input:hidden[name="sendClientId"]').remove();
		$('input:hidden[name="sendInsuNum"]').remove();
		$('input:hidden[name="sendLoanAccountNum"]').remove();
		$('input:hidden[name="sendIrpAccountNum"]').remove();		
		
		$('#propertyCosentAgreeForm').append($('<input type="hidden" name="sendClientId" value="" />'));		
		
		var $insuConsentYn = $('input[name=insuConsentYn]');
		var $loanConsentYn = $('input[name=loanConsentYn]');
		var $irpConsentYn = $('input[name=irpConsentYn]');
		if ($insuConsentYn.length) {
			$('input:hidden[name="sendClientId"]').val($('input:hidden[name="insuClient"]').val());
		}
		if ($irpConsentYn.length) {
			$('input:hidden[name="sendClientId"]').val($('input:hidden[name="loanClient"]').val());	
		}
		if ($irpConsentYn.length) {
			$('input:hidden[name="sendClientId"]').val($('input:hidden[name="irpClient"]').val());		
		}
		
		var insuConsentYnCnt = $("input:checkbox[name=insuConsentYn]:checked").length;
		var loanConsentYnCnt = $("input:checkbox[name=loanConsentYn]:checked").length;
		var irpConsentYnCnt = $("input:checkbox[name=irpConsentYn]:checked").length;
		
		// 보험
		$('input:checkbox[name=insuConsentYn]:checked').each(function(i, elements){
			var idx = $(elements).index("input:checkbox[name=insuConsentYn]");
			var val = $('input:hidden[name=insuInsuNum]').eq(idx).val();
			$('#propertyCosentAgreeForm').append($('<input type="hidden" name="sendInsuNum" value="' + val + '" />'));		
		});
		
		// 대출
		$('input:checkbox[name=loanConsentYn]:checked').each(function(i, elements){
			var idx = $(elements).index("input:checkbox[name=loanConsentYn]");
			var val = $('input:hidden[name=loanAccountNum]').eq(idx).val();		
			$('#propertyCosentAgreeForm').append($('<input type="hidden" name="sendLoanAccountNum" value="' + val + '" />'));		
		});
		
		// 개인형IRP
		$('input:checkbox[name=irpConsentYn]:checked').each(function(i, elements){
			var idx = $(elements).index("input:checkbox[name=irpConsentYn]");
			var val = $('input:hidden[name=irpAccountNum]').eq(idx).val();
			$('#propertyCosentAgreeForm').append($('<input type="hidden" name="sendIrpAccountNum" value="' + val + '" />'));		
		});

		$("#propertyCosentAgreeForm").submit(); 
	});
	
});

</script>
</head>
<%
	// 본인인증 요청시 반환된 접수아이디
	//String receiptID = (String) request.getAttribute("receiptID");
	String receiptID = "testId";
	
 	System.out.println("==개인신용정보 전송요구 동의==>>> " + receiptID);

%>
<body>
	<div class="wrapper">
		<div class="content">
			<span style="font-size: 20px;">개인신용정보 전송요구 동의</span><br/>
			<span style="font-size: 15px;">1. 전송요구동의 > 2.본인인증 > <b>3.자산목록선택</b></span>				
			<c:choose>
				<c:when test="${clientCnt == 0}">
					<div style="font-size: 15px; margin-top: 20px;">
						<b>등록된 회원이 아닙니다.</b><br/>
						<b>본인동의 회원 등록 후 재인증해주시기 바랍니다.</b><br/>
						<div align="center" style="margin-top: 10px;">
							<button class="btn" type="button" id="back_btn" style="font-size: 12px;">전송요구 동의<br/>페이지로 이동</button>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div style="line-height: 170%; font-size: 13px; margin-top: 3px;">
						전송요구 대상 자산 목록을 선택해 주세요.<br/>
						- 보험 : 보험 계약상태가 정상, 실효. 만기(5년 이내)인 계약<br/>
						- 대출 : 현재 유효한 보험대출계약 및 일반대출계약<br/>
						- 개인형IRP : 현재 유효한 개인형IRP 계약
					</div>
					<div>
						<font style="font-size: 15px;">◆ 보험계약</font>
						<table border="1">
						<colgroup>
					        <col width="5%">		
					        <col width="20%">
					        <col width="*">
			    		</colgroup>
			    		<thead>
			    		<tr>
			    			<th></th>
			    			<th>증권번호</th>
			    			<th>상품명(피보험자)</th>
			    		</tr>
			    		</thead>
						<tbody>	
						<c:choose>
							<c:when test="${fn:length(insuList) == 0}">
								<tr>
									<td align="center" colspan="3">해당하는 자산 목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="insuMap" items="${insuList}">
								<tr>
									<td align="center">								
										<input type="checkbox" name="insuConsentYn" 
											<c:if test="${insuMap.isScheduled eq '1'}">checked</c:if>
												value="<c:out value='${insuMap.isScheduled}' />" />
										<input type="hidden" name="insuClient" value="<c:out value='${insuMap.clientId}'/>" />
										<input type="hidden" name="insuInsuNum" value="<c:out value='${insuMap.insuNum}'/>" />
										<input type="hidden" name="insuProdName" value="<c:out value='${insuMap.prodName}'/>" />
										<input type="hidden" name="insuInsuredName" value="<c:out value='${insuMap.insuredName}'/>" />														
									</td>
									<td>
										<c:out value="${insuMap.insuNum}" />
									</td>
									<td>
										<c:out value="${insuMap.prodName}" />
										<span style="font-size: 10px;">(<c:out value="${insuMap.insuredName}" />)</span>									
									</td>								
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
						</table>
					</div>
					<div>
					<font style="font-size: 15px;">◆ 대출계약</font>
						<table border="1">
						<colgroup>
					        <col width="5%">		
					        <col width="20%">
					        <col width="*">
			    		</colgroup>
			    		<thead>
			    		<tr>
			    			<th></th>
			    			<th>계좌번호</th>
			    			<th>상품명(계약일자)</th>
			    		</tr>
			    		</thead>
						<tbody>		
						<c:choose>
							<c:when test="${fn:length(loanList) == 0}">
								<tr>
									<td align="center" colspan="3">해당하는 자산 목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="loanMap" items="${loanList}">
								<tr>
									<td align="center">	
										<input type="checkbox" name="loanConsentYn" <c:if test="${loanMap.isScheduled eq '1'}">checked</c:if> />
										<input type="hidden" name="loanClient" value="<c:out value='${loanMap.clientId}'/>" />
										<input type="hidden" name="loanAccountNum" value="<c:out value='${loanMap.accountNum}'/>" />
										<input type="hidden" name="loanProdName" value="<c:out value='${loanMap.prodName}'/>" />
										<input type="hidden" name="loanLoanStartDate" value="<c:out value='${loanMap.loanStartDate}'/>" />
										<input type="hidden" name="loanLoanExpDate" value="<c:out value='${loanMap.loanExpDate}'/>" />
									</td>
									<td><c:out value="${loanMap.accountNum}" /></td>
									<td>
										<c:out value="${loanMap.prodName}" />
										<span style="font-size: 10px;">
											(<c:out value="${loanMap.loanStartDate}" /> ~ 
											<c:out value="${loanMap.loanExpDate}" />)
										</span>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
						</table>
					</div>
					<div>
						<font style="font-size: 15px;">◆ 개인형IRP</font>
						<table border="1">
						<colgroup>
					        <col width="5%">		
					        <col width="20%">
					        <col width="*">
			    		</colgroup>
			    		<thead>
			    		<tr>
			    			<th></th>
			    			<th>계좌번호</th>
			    			<th>상품명(개설일)</th>
			    		</tr>
			    		</thead>
						<tbody>			
						<c:choose>
							<c:when test="${fn:length(irpList) == 0}">
								<tr>
									<td align="center" colspan="3">해당하는 자산 목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="irpMap" items="${irpList}">
								<tr>
									<td align="center">
										<input type="checkbox" name="irpConsentYn" <c:if test="${irpMap.isScheduled eq '1'}">checked</c:if> />
										<input type="hidden" name="irpClient" value="<c:out value='${irpMap.clientId}'/>" />
										<input type="hidden" name="irpAccountNum" value="<c:out value='${irpMap.accountNum}'/>" />
										<input type="hidden" name="irpProdName" value="<c:out value='${irpMap.prodName}'/>" />
										<input type="hidden" name="irpIssueDate" value="<c:out value='${irpMap.issueDate}'/>" />
									</td>
									<td><c:out value="${irpMap.accountNum}" /></td>
									<td>
										<c:out value="${irpMap.prodName}" />
										<span style="font-size: 10px;">
											(<c:out value="${irpMap.issueDate}" />)
										</span>
									</td>
								</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						</tbody>
						</table>
					</div>			
					<div style="line-height: 50%; margin-top: 10px;">
						<input type="checkbox" name="consentAgreeYn" id="consentAgreeYn" /> 
						<span style="font-size: 13px;">개인신용정보 정기적 전송 동의</span><br/>
						<span style="font-size: 13px;">* 정기적 전송 동의시 해당 정보를 1일 4회 서비스 사업자에 제공합니다.</span>
					</div>
				
					<div align="center" style="margin-top: 20px;">
						<button id="modalOpenBtn" class="btn">선택완료</button>				
					</div>
					
					<div id="modal">
						<div class="modal_content">
							<span style="font-size: 15px;">선택하신 자산 목록은 아래와 같습니다.</span>
							<div id="modal_content_insu"></div>
							<div id="modal_content_loan"></div>
							<div id="modal_content_irp"></div>
							<div align="center">
								<button class="small_btn" id="modalCloseBtn">다시선택</button>
								<button class="small_btn" style="color: white; background: #000000;" id="modalSendBtn">최종확인</button>
							</div>
						</div>
						<div class="modal_layer"></div>
				 	</div>
					<!--// class="modal" -->
				</c:otherwise>
			</c:choose>
			
		</div>
		<!--// class="content" -->
	</div>
	<!--// class="wrapper" -->
	<form method="post" id="propertyCosentAgreeForm" name="propertyCosentAgreeForm" action="./consentStep4">
		<input type="hidden" name="sendClientId" value="" />
		<input type="hidden" name="sendInsuNum" value="" />
		<input type="hidden" name="sendLoanAccountNum" value="" />
		<input type="hidden" name="sendIrpAccountNum" value="" />
	</form>
</body>
</html>