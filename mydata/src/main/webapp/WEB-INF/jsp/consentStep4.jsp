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
</style>
<title>개인신용정보 전송요구 동의</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		document.getElementById("back_btn").onclick = function() {
		    location.href="/consentStep1";	    
		}		
	});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			<font size="5em">개인신용정보 전송요구 동의 완료</font>
			<c:if test="${fn:length(insuList) != 0}">
				<div>
					<span style="font-size: 15px;">◆ 보험계약</span>
					<table border="1">
					<colgroup>		
				        <col width="20%">
				        <col width="*">
		    		</colgroup>
		    		<thead>
		    		<tr>
		    			<th>증권번호</th>
		    			<th>상품명(피보험자)</th>
		    		</tr>
		    		</thead>
					<tbody>					
						<c:forEach var="insuMap" items="${insuList}">
						<tr>							
							<td>
								<c:out value="${insuMap.insuNum}" />
							</td>
							<td>
								<c:out value="${insuMap.prodName}" />
								<span style="font-size: 10px;">(<c:out value="${insuMap.insuredName}" />)</span>									
							</td>								
						</tr>
						</c:forEach>	
					</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${fn:length(loanList) != 0}">
				<div>
				<span style="font-size: 15px;">◆ 대출계약</span>
					<table border="1">
					<colgroup>	
				        <col width="20%">
				        <col width="*">
		    		</colgroup>
		    		<thead>
		    		<tr>
		    			<th>계좌번호</th>
		    			<th>상품명(계약일자)</th>
		    		</tr>
		    		</thead>
					<tbody>				
						<c:forEach var="loanMap" items="${loanList}">
						<tr>
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
					</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${fn:length(irpList) != 0}">
				<div>
					<font style="font-size: 15px;">◆ 개인형IRP</font>
					<table border="1">
					<colgroup>	
				        <col width="20%">
				        <col width="*">
		    		</colgroup>
		    		<thead>
		    		<tr>
		    			<th>계좌번호</th>
		    			<th>상품명(개설일)</th>
		    		</tr>
		    		</thead>
					<tbody>
						<c:forEach var="irpMap" items="${irpList}">
						<tr>
							<td><c:out value="${irpMap.accountNum}" /></td>
							<td>
								<c:out value="${irpMap.prodName}" />
								<span style="font-size: 10px;">
									(<c:out value="${irpMap.issueDate}" />)
								</span>
							</td>
						</tr>
						</c:forEach>	
					</tbody>
					</table>
				</div>
			</c:if>
			<div align="right" style="margin-top:10px;">
		 		<button class="btn" type="button" id="back_btn" style="font-size: 12px;">전송요구 동의<br/>페이지로 이동</button>
		 	</div>
		</div>		
	</div>
</body>
</html>