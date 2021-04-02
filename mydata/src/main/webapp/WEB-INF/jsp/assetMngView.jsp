<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="common.jsp" %>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>자산관리 List</title>
</head>

<style>
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
	margin:0;   
}

#modal button {
	display:inline-block;
	width:100px;
}

#modal .modal_content {
	width:400px;
	margin:50px auto;
	padding:20px 10px;
	background:#fff;
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

#modal_loan {
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

#modal_loan h2 {
	margin:0;   
}

#modal_loan button {
	display:inline-block;
	width:100px;
}

#modal_loan .modal_loan_content {
	width:500px;
	margin:50px auto;
	padding:20px 10px;
	background:#fff;
	border:2px solid #666;
}

#modal_loan .modal_loan_layer {
	position:fixed;
	top:0;
	left:0;
	width:100% auto;
	height:100% auto;
	background:rgba(0, 0, 0, 0.5);
	z-index:-1;
}   

#modal_irp {
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
	
#modal_irp h2 {
	margin:0;   
}
	
#modal_irp button {
	display:inline-block;
	width:100px;
}

#modal_irp .modal_irp_content {
	width:500px;
	margin:50px auto;
	padding:20px 10px;
	background:#fff;
	border:2px solid #666;
}

#modal_irp .modal_irp_layer {
	position:fixed;
	top:0;
	left:0;
	width:100% auto;
	height:100% auto;
	background:rgba(0, 0, 0, 0.5);
	z-index:-1;
} 
</style>

<body>
	<div class="wrapper">
		<div class="content">
			<div>
				<span style="font-size: 20px;">본인동의회원 자산관리</span>				
			</div>			
			<div style="width:400px; margin-top:5px;">
				<span style="font-size: 14px;">보험목록</span>		
				<table border="1">
				<thead>
					<tr>
						<td align="center">선택</td>
						<td align="center">No</td>
						<td align="center">클라이언트ID</td>
						<td align="center">기관코드</td>
						<td align="center">증권번호</td>
						<td align="center">수정</td>
					</tr>
				</thead>					
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tfoot>
							<tr>
								<td align="center" colspan="6">해당하는 자산 목록이 없습니다.</td>
							</tr>
						</tfoot>
					</c:when>
					<c:otherwise>							
					<tbody>							
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<td align="center"><input type="checkbox" name="chk" id="chk" /></td>	
								<td align="center">${status.count}</td>
								<td align="center">${result.clientId}</td>
								<td align="center">${result.orgCode}</td>
								<td align="center">${result.insuNum}</td>
								<td align="center"><a href="javascript:fn_modichk('${result.clientId}', '${result.orgCode}', '${result.insuNum}');">수정</a></td>
							</tr>
						</c:forEach>
					</tbody>						
					</c:otherwise>
				</c:choose>						
				</table>
				<div id="root" align="right">
					<button class="small_btn" type="button" id="modal_opne_btn">입력</button>
				 	<button class="small_btn" type="button" id="btn_delete" onclick="fn_delete();">삭제</button>
				</div>
			</div>
			
			<div style="width:400px; margin-top:5px;">
				<span style="font-size: 14px;">대출목록</span>	
				<table border="1">
				<thead>
					<tr>
						<td align="center">선택</td>
						<td align="center">No</td>
						<td align="center">클라이언트ID</td>
						<td align="center">기관코드</td>
						<td align="center">계좌번호</td>
						<td align="center">수정</td>
					</tr>
				</thead>				
				<c:choose>
					<c:when test="${listLoan.size() == 0}">
						<tfoot>
							<tr>
								<td align="center" colspan="6">해당하는 자산 목록이 없습니다.</td>
							</tr>
						</tfoot>
					</c:when>
					<c:otherwise>							
					<tbody>							
						<c:forEach var="result" items="${listLoan}" varStatus="status">
							<tr>
								<td align="center"><input type="checkbox" name="chk_loan" id="chk_loan" /></td>	
								<td align="center">${status.count}</td>
								<td align="center">${result.clientId}</td>
								<td align="center">${result.orgCode}</td>
								<td align="center">${result.accountNum}</td>
								<td align="center"><a href="javascript:fn_modichk_loan('${result.clientId}', '${result.orgCode}', '${result.accountNum}');">수정</a></td>
							</tr>
						</c:forEach>
					</tbody>						
					</c:otherwise>
				</c:choose>						
				</table>
				<div id="root" align="right">
				   	<button class="small_btn" type="button" id="modal_loan_opne_btn">입력</button>
				   	<button class="small_btn" type="button" id="btn_loan_delete" onclick="fn_delete_loan();">삭제</button>
				 </div>
			</div>		 
			 
			 <div style="width:400px; margin-top:5px;">
				<span style="font-size: 14px;">개인형IRP목록</span>	
				<table border="1">
				<thead>
					<tr>
						<td align="center">선택</td>
						<td align="center">No</td>
						<td align="center">클라이언트ID</td>
						<td align="center">기관코드</td>
						<td align="center">계좌번호</td>
						<td align="center">수정</td>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${listIrp.size() == 0}">
						<tfoot>
							<tr>
								<td align="center" colspan="6">해당하는 자산 목록이 없습니다.</td>
							</tr>
						</tfoot>
					</c:when>
					<c:otherwise>						
					<tbody>						
						<c:forEach var="result" items="${listIrp}" varStatus="status">
							<tr>
								<td align="center"><input type="checkbox" name="chk_irp" id="chk_irp" /></td>	
								<td align="center">${status.count}</td>
								<td align="center">${result.clientId}</td>
								<td align="center">${result.orgCode}</td>
								<td align="center">${result.accountNum}</td>
								<td align="center"><a href="javascript:fn_modichk_irp('${result.clientId}', '${result.orgCode}', '${result.accountNum}');">수정</a></td>
							</tr>
						</c:forEach>
					</tbody>
						
					</c:otherwise>
				</c:choose>							
				</table>
				<div id="root" align="right">
				   	<button class="small_btn" type="button" id="modal_irp_opne_btn">입력</button>
				   	<button class="small_btn" type="button" id="btn_irp_delete" onclick="fn_delete_irp();">삭제</button>
				 </div>				 
			 </div>
			 <div align="right" style="margin-top:20px;">
			 	<button class="btn" type="button" id="back_btn" style="font-size: 12px;">회원정보 페이지로 이동</button>
			 </div>
			 
			 <div id="modal">   
			   	 <div class="modal_content">
			  		 <form id="frm" method="post">
						 <input type="hidden" name="clientCode" id="clientCode" value="021010000014" />
						 <input type="hidden" name="orgCode" id="orgCode" />
						 <input type="hidden" name="insuNum" id="insuNum" />
						 <table boder="1">
						 <tbody>
						 	<tr>
						 		<td>클라이언트ID</td>
						 		<td><input type="text" name="clientId" id="clientId" style="width:100%;" value="<c:out value='${clientId}'/>" /></td>
						 	</tr>
						 	<tr>
						 		<td>기관코드</td>
						 		<td><input type="text" name="orgCodeC" id="orgCodeC" style="width:100%;" /></td>
						 	</tr>
						 	<tr>
						 		<td>증권번호</td>
						 		<td><input type="text" name="insuNumC" id="insuNumC" style="width:100%;" /></td>
						 	</tr>
						 </tbody>						 
						 </table>
						 <div align="right">
							<button class="small_btn" type="button" id="btn_insert" onclick="fn_insert();">입력</button>
							<button class="small_btn" type="button" id="btn_modify" onclick="fn_modify();">수정</button>
							<button class="small_btn" type="button" id="modal_close_btn">닫기</button> 
						 </div>
					 </form>
					       
			   	 </div>
			   	 <div class="modal_layer"></div>
			 </div>
			 
			 <div id="modal_loan">   
			   	 <div class="modal_loan_content">
			  		 <form id="frm_loan" method="post">
						 <input type="hidden" name="clientCode_loan" id="clientCode_loan" value="021010000014" />
						 <input type="hidden" name="orgCode_loan" id="orgCode_loan" />
						 <input type="hidden" name="accountNum_loan" id="accountNum_loan" />
						 <table boder="1">
						 <tbody>
						 	<tr>
						 		<td>클라이언트ID</td>
						 		<td><input type="text" name="clientId_loan" id="clientId_loan" style="width:100%;" value="<c:out value='${clientId}'/>" /></td>
						 	</tr>
						 	<tr>
						 		<td>기관코드</td>
						 		<td><input type="text" name="orgCodeC_loan" id="orgCodeC_loan" style="width:100%;" /></td>
						 	</tr>
						 	<tr>
						 		<td>계좌번호</td>
						 		<td><input type="text" name="accountNumC_loan" id="accountNumC_loan" style="width:100%;" /></td>
						 	</tr>
						 </tbody>						 
						 </table>
						 <div align="right">
						 	<button class="small_btn" type="button" id="btn_insert_loan" onclick="fn_insert_loan();">입력</button>
							 <button class="small_btn" type="button" id="btn_modify_loan" onclick="fn_modify_loan();">수정</button>
					       	 <button class="small_btn" type="button" id="modal_loan_close_btn">닫기</button> 
						 </div>
					 </form>					       
			   	 </div>
			   	 <div class="modal_loan_layer"></div>
			 </div>
			 
			 <div id="modal_irp">   
			   	 <div class="modal_irp_content">
			  		 <form id="frm_irp" method="post">
						 <input type="hidden" name="clientCode_irp" id="clientCode_irp" value="021010000014" />
						 <input type="hidden" name="orgCode_irp" id="orgCode_irp" />
						 <input type="hidden" name="accountNum_irp" id="accountNum_irp" />
						 <table boder="1">
						 <tbody>
						 	<tr>
						 		<td>클라이언트ID</td>
						 		<td><input type="text" name="clientId_irp" id="clientId_irp" style="width:100%;" value="<c:out value='${clientId}'/>" /></td>
						 	</tr>
						 	<tr>
						 		<td>기관코드</td>
						 		<td><input type="text" name="orgCodeC_irp" id="orgCodeC_irp" style="width:100%;" /></td>
						 	</tr>
						 	<tr>
						 		<td>계좌번호</td>
						 		<td><input type="text" name="accountNumC_irp" id="accountNumC_irp" style="width:100%;" /></td>
						 	</tr>
						 </tbody>						 
						 </table>
						 <div align="right">
							<button class="small_btn" type="button" id="btn_insert_irp" onclick="fn_insert_irp();">입력</button>
							<button class="small_btn" type="button" id="btn_modify_irp" onclick="fn_modify_irp();">수정</button>
							<button class="small_btn" type="button" id="modal_irp_close_btn">닫기</button>
						 </div>
					 </form>					        
			   	 </div>
			   	 <div class="modal_irp_layer"></div>
			 </div>
		
		 </div>
	</div>	 
</body>
	
<script type="text/javascript">

	document.getElementById("back_btn").onclick = function() {
	    location.href="/member/detail";	    
	}

	document.getElementById("modal_opne_btn").onclick = function() {
	    document.getElementById("modal").style.display="block";
	    
	    document.getElementById("modal_loan").style.display="none";
	    document.getElementById("modal_irp").style.display="none";
	    
	    document.getElementById('btn_modify').style.display="none";	    
	}
	
	document.getElementById("modal_close_btn").onclick = function() {
	    document.getElementById("modal").style.display="none";
	    
	    //document.getElementById('clientId').value = '';
		document.getElementById('orgCodeC' ).value = '';
		document.getElementById('insuNumC' ).value = '';		
	}
	
	document.getElementById("modal_loan_opne_btn").onclick = function() {
	    document.getElementById("modal").style.display="none";	    
	    document.getElementById("modal_loan").style.display="block";
	    document.getElementById("modal_irp").style.display="none";
	    
	    document.getElementById('btn_modify_loan').style.display="none";	    
	}
	
	document.getElementById("modal_loan_close_btn").onclick = function() {
	    document.getElementById("modal_loan").style.display="none";
	    
	    //document.getElementById('clientId_loan').value = '';
		document.getElementById('orgCodeC_loan' ).value = '';	
		document.getElementById('accountNumC_loan' ).value = '';		
	}
	
	document.getElementById("modal_irp_opne_btn").onclick = function() {
	    document.getElementById("modal").style.display="none";	    
	    document.getElementById("modal_loan").style.display="none";
	    document.getElementById("modal_irp").style.display="block";
	    
	    document.getElementById('btn_modify_irp').style.display="none";	    
	}
	
	document.getElementById("modal_irp_close_btn").onclick = function() {
	    document.getElementById("modal_irp").style.display="none";
	    
	    //document.getElementById('clientId_irp').value = '';
		document.getElementById('orgCodeC_irp' ).value = '';	
		document.getElementById('accountNumC_irp' ).value = '';		
	}       
	
	// 체크박스 Event
	function fn_checkBox() {
		
		document.getElementById('btn_insert').disabled = true;
		document.getElementById('btn_modify').disabled = false;
		
		var checkbox = $("input[name=chk]:checked");
		
		// 체크박스는 1건만..
		if( checkbox.length > 1 ) {
			alert("수정은 1건만 가능합니다.");
			$("input:checkbox[id='chk']").attr("checked", false);
			$("input:checkbox[id='chk_loan']").attr("checked", false);
			$("input:checkbox[id='chk_irp']").attr("checked", false);
			return;
		}
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var clientId = td.eq(2).text();
			var orgCode = td.eq(3).text();
			var insuNum = td.eq(4).text();
	
			// 모달 open
			document.getElementById("modal").style.display="block";
			document.getElementById("modal_loan").style.display="none";
			document.getElementById("modal_irp").style.display="none";
			
			document.getElementById('clientId').disabled = true; 
			document.getElementById('clientId').value = clientId.trim();
			
			document.getElementById('orgCode').value = orgCode.trim();
			document.getElementById('insuNum').value = insuNum.trim();
			
			document.getElementById('orgCodeC').value = orgCode.trim();
			document.getElementById('insuNumC').value = insuNum.trim();
			
		});
		
	}
	
	// 수정화면 생성
	function fn_modichk(arg1, arg2, arg3) {
	
		document.getElementById('btn_insert').style.display="none";
		document.getElementById('btn_modify').style.display="inline-block";
	
		// 모달 open
		document.getElementById("modal").style.display="block";
		document.getElementById("modal_loan").style.display="none";
		document.getElementById("modal_irp").style.display="none";
		
		document.getElementById('clientId').disabled = true; 
		document.getElementById('clientId').value = arg1;
		
		document.getElementById('orgCode').value = arg2;
		document.getElementById('insuNum').value = arg3;
		
		document.getElementById('orgCodeC').value = arg2;
		document.getElementById('insuNumC').value = arg3;
	}
	
	// 대출 수정화면 생성
	function fn_modichk_loan(arg1, arg2, arg3) {
	
		document.getElementById('btn_insert_loan').style.display="none";
		document.getElementById('btn_modify_loan').style.display="inline-block";
	
		// 모달 open
		document.getElementById("modal").style.display="none";
		document.getElementById("modal_loan").style.display="block";
		document.getElementById("modal_irp").style.display="none";
		
		document.getElementById('clientId_loan').disabled = true; 
		document.getElementById('clientId_loan').value = arg1;
		
		document.getElementById('orgCode_loan').value = arg2;
		document.getElementById('accountNum_loan').value = arg3;
		
		document.getElementById('orgCodeC_loan').value = arg2;
		document.getElementById('accountNumC_loan').value = arg3;
	}
	
	// irp 수정화면 생성
	function fn_modichk_irp(arg1, arg2, arg3) {
	
		document.getElementById('btn_insert_irp').style.display="none";
		document.getElementById('btn_modify_irp').style.display="inline-block";
	
		// 모달 open
		document.getElementById("modal").style.display="none";
		document.getElementById("modal_loan").style.display="none";
		document.getElementById("modal_irp").style.display="block";
		
		document.getElementById('clientId_irp').disabled = true; 
		document.getElementById('clientId_irp').value = arg1;
		
		document.getElementById('orgCode_irp').value = arg2;
		document.getElementById('accountNum_irp').value = arg3;
		
		document.getElementById('orgCodeC_irp').value = arg2;
		document.getElementById('accountNumC_irp').value = arg3;
	}
	
	
	// 체크박스 Event
	function fn_checkBox_loan() {
		
		document.getElementById('btn_insert_loan').disabled = true;
		//document.getElementById('btn_modify_loan').disabled = false;
		
		var checkbox = $("input[name=chk_loan]:checked");
		
		// 체크박스는 1건만..
		if( checkbox.length > 1 ) {
			alert("수정은 1건만 가능합니다.");
			$("input:checkbox[id='chk']").attr("checked", false);
			$("input:checkbox[id='chk_loan']").attr("checked", false);
			$("input:checkbox[id='chk_irp']").attr("checked", false);
			return;
		}
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var clientId_loan = td.eq(2).text();
			var orgCode_loan = td.eq(3).text();
			var accountNum_loan = td.eq(4).text();
	
			// 모달 open
			document.getElementById("modal").style.display="none";
			document.getElementById("modal_loan").style.display="block";
			document.getElementById("modal_irp").style.display="none";
			
			document.getElementById('clientId_loan').disabled = true; 
			document.getElementById('clientId_loan').value = clientId_loan.trim();
			
			document.getElementById('orgCode_loan').value = orgCode_loan.trim();
			document.getElementById('accountNum_loan').value = accountNum_loan.trim();
			
			document.getElementById('orgCodeC_loan').value = orgCode_loan.trim();
			document.getElementById('accountNumC_loan').value = accountNum_loan.trim();
			
		});
		
	}
	

	// 입력
	function fn_insert() {

		var clientId = document.getElementById('clientId').value;
		var orgCode  = document.getElementById('orgCodeC' ).value;
		var insuNum  = document.getElementById('insuNumC' ).value;
		
		if ( clientId == '' ) {
			alert("클라이언트ID를 입력하세요.");
			return false;
		}
		
		if ( orgCode == '' ) {
			alert("기관코드를 입력하세요.");
			return false;
		}
		
		if ( insuNum == '' ) {
			alert("증권번호를 입력하세요.");
			return false;
		}
	
		if(!confirm("입력하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetInsert',
			type: "POST",
			//dataType: "",
			data: {
					clientId : clientId,
					orgCode : orgCode,
					insuNum : insuNum
			},
			success: function(data){
 				//alert(data);
 				
 				if( data > 0 ) {
					alert("기존 데이터가 존재합니다.");
					return;
				}

				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
				alert("status : " + status + ' - ' + "error : " + error);
				console.log("error");
			}
		});

	}
	
	// 대출 입력
	function fn_insert_loan() {

		var clientId = document.getElementById('clientId_loan').value;
		var orgCode  = document.getElementById('orgCodeC_loan' ).value;
		var accountNum  = document.getElementById('accountNumC_loan' ).value;
		
		if ( clientId == '' ) {
			alert("클라이언트ID를 입력하세요.");
			return false;
		}
		
		if ( orgCode == '' ) {
			alert("기관코드를 입력하세요.");
			return false;
		}
		
		if ( accountNum == '' ) {
			alert("계좌번호를 입력하세요.");
			return false;
		}
	
		if(!confirm("입력하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetInsertLoan',
			type: "POST",
			//dataType: "",
			data: {
					clientId : clientId,
					orgCode : orgCode,
					accountNum : accountNum
			},
			success: function(data){
 				//alert(data);
 				
 				if( data > 0 ) {
					alert("기존 데이터가 존재합니다.");
					return;
				}

				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
				alert("status : " + status + ' - ' + "error : " + error);
				console.log("error");
			}
		});

	}
	
	// 개인형IRP 입력
	function fn_insert_irp() {

		var clientId = document.getElementById('clientId_irp').value;
		var orgCode  = document.getElementById('orgCodeC_irp' ).value;
		var accountNum  = document.getElementById('accountNumC_irp' ).value;
		
		if ( clientId == '' ) {
			alert("클라이언트ID를 입력하세요.");
			return false;
		}
		
		if ( orgCode == '' ) {
			alert("기관코드를 입력하세요.");
			return false;
		}
		
		if ( accountNum == '' ) {
			alert("계좌번호를 입력하세요.");
			return false;
		}
	
		if(!confirm("입력하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetInsertIrp',
			type: "POST",
			//dataType: "",
			data: {
					clientId : clientId,
					orgCode : orgCode,
					accountNum : accountNum
			},
			success: function(data){
 				//alert(data);
 				
 				if( data > 0 ) {
					alert("기존 데이터가 존재합니다.");
					return;
				}

				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
				alert("status : " + status + ' - ' + "error : " + error);
				console.log("error");
			}
		});

	}
	
	// 수정
	function fn_modify() {
		
		var clientId = document.getElementById('clientId').value;
		var orgCode  = document.getElementById('orgCodeC' ).value;
		var insuNum  = document.getElementById('insuNumC' ).value;
		
		if ( clientId == '' ) {
			alert("클라이언트ID를 입력하세요.");
			return false;
		}
		
		if ( orgCode == '' ) {
			alert("기관코드를 입력하세요.");
			return false;
		}
		
		if ( insuNum == '' ) {
			alert("증권번호를 입력하세요.");
			return false;
		}

		if(!confirm("수정하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetModify',
			type: "POST",
			//dataType: "",
			data: {
					clientId : document.getElementById('clientId').value,
					orgCode : document.getElementById('orgCode').value,
					insuNum : document.getElementById('insuNum').value,
					
					orgCodeC : document.getElementById('orgCodeC').value,
					insuNumC : document.getElementById('insuNumC').value
			},
			success: function(data){
// 					alert(data);
					
// 					if( data > 0 ) {
// 						alert("기존 데이터가 존재합니다.");
// 						return;
// 					}
					
				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
// 				alert("status : " + status + ' - ' + "error : " + error);
				alert("기존 데이터가 존재합니다.");
				console.log("error");
			}
		});
	}
	
	// 대출 수정
	function fn_modify_loan() {
		
		var clientId = document.getElementById('clientId_loan').value;
		var orgCode  = document.getElementById('orgCodeC_loan' ).value;
		var accountNum  = document.getElementById('accountNumC_loan' ).value;
		
		if ( clientId == '' ) {
			alert("클라이언트ID를 입력하세요.");
			return false;
		}
		
		if ( orgCode == '' ) {
			alert("기관코드를 입력하세요.");
			return false;
		}
		
		if ( accountNum == '' ) {
			alert("계좌번호를 입력하세요.");
			return false;
		}

		if(!confirm("수정하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetModifyLoan',
			type: "POST",
			//dataType: "",
			data: {
					clientId : document.getElementById('clientId_loan').value,
					orgCode : document.getElementById('orgCode_loan').value,
					accountNum : document.getElementById('accountNum_loan').value,
					
					orgCodeC : document.getElementById('orgCodeC_loan').value,
					accountNumC : document.getElementById('accountNumC_loan').value
			},
			success: function(data){
// 					alert(data);
					
// 					if( data > 0 ) {
// 						alert("기존 데이터가 존재합니다.");
// 						return;
// 					}
					
				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
// 				alert("status : " + status + ' - ' + "error : " + error);
				alert("기존 데이터가 존재합니다.");
				console.log("error");
			}
		});
	}
	
	// 개인형IRP 수정
	function fn_modify_irp() {
		
		var clientId = document.getElementById('clientId_irp').value;
		var orgCode  = document.getElementById('orgCodeC_irp' ).value;
		var accountNum  = document.getElementById('accountNumC_irp' ).value;
		
		if ( clientId == '' ) {
			alert("클라이언트ID를 입력하세요.");
			return false;
		}
		
		if ( orgCode == '' ) {
			alert("기관코드를 입력하세요.");
			return false;
		}
		
		if ( accountNum == '' ) {
			alert("계좌번호를 입력하세요.");
			return false;
		}

		if(!confirm("수정하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetModifyIrp',
			type: "POST",
			//dataType: "",
			data: {
					clientId : document.getElementById('clientId_irp').value,
					orgCode : document.getElementById('orgCode_irp').value,
					accountNum : document.getElementById('accountNum_irp').value,
					
					orgCodeC : document.getElementById('orgCodeC_irp').value,
					accountNumC : document.getElementById('accountNumC_irp').value
			},
			success: function(data){
// 					alert(data);
					
// 					if( data > 0 ) {
// 						alert("기존 데이터가 존재합니다.");
// 						return;
// 					}
					
				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
// 				alert("status : " + status + ' - ' + "error : " + error);
				alert("기존 데이터가 존재합니다.");
				console.log("error");
			}
		});
	}		
	
	// 삭제
	function fn_delete() {
		
		var checkbox = $("input[name=chk]:checked");
		
		// 체크박스는 1건만..
		if( checkbox.length > 1 ) {
			alert("삭제는 1건만 가능합니다.");
			$("input:checkbox[id='chk']").attr("checked", false);
			return;
			
		} else if( checkbox.length == 0 ) {
			alert("삭제할 건을 선택하세요.");
			return;
		}
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var clientId = td.eq(2).text();
			var orgCode = td.eq(3).text();
			var insuNum = td.eq(4).text();
			
			document.getElementById('clientId').value = clientId.trim();
			document.getElementById('orgCode').value = orgCode.trim();
			document.getElementById('insuNum').value = insuNum.trim();
			
		});
		
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetDelete',
			type: "POST",
			//dataType: "",
			data: {
					clientId : document.getElementById('clientId').value,
					orgCode : document.getElementById('orgCode').value,
					insuNum : document.getElementById('insuNum').value
			},
			success: function(data){
					//alert(data);
					
					if( data == 0 ) {
						alert("기존 데이터가 존재하지 않습니다.");
						return;
					}
					
				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
				alert("status : " + status + ' - ' + "error : " + error);
				console.log("error");
			}
		});
	}
	
	// 대출 삭제
	function fn_delete_loan() {
		
		var checkbox = $("input[name=chk_loan]:checked");
		
		// 체크박스는 1건만..
		if( checkbox.length > 1 ) {
			alert("삭제는 1건만 가능합니다.");
			$("input:checkbox[id='chk']").attr("checked", false);
			$("input:checkbox[id='chk_loan']").attr("checked", false);
			$("input:checkbox[id='chk_irp']").attr("checked", false);
			return;
			
		} else if( checkbox.length == 0 ) {
			alert("삭제할 건을 선택하세요.");
			return;
		}
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var clientId = td.eq(2).text();
			var orgCode = td.eq(3).text();
			var accountNum = td.eq(4).text();
			
			document.getElementById('clientId_loan').value = clientId.trim();
			document.getElementById('orgCode_loan').value = orgCode.trim();
			document.getElementById('accountNum_loan').value = accountNum.trim();
			
		});
		
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetDeleteLoan',
			type: "POST",
			//dataType: "",
			data: {
					clientId : document.getElementById('clientId_loan').value,
					orgCode : document.getElementById('orgCode_loan').value,
					accountNum : document.getElementById('accountNum_loan').value
			},
			success: function(data){
					//alert(data);
					
					if( data == 0 ) {
						alert("기존 데이터가 존재하지 않습니다.");
						return;
					}
					
				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
				alert("status : " + status + ' - ' + "error : " + error);
				console.log("error");
			}
		});
	}
	
	// 개인형IRP 삭제
	function fn_delete_irp() {
		
		var checkbox = $("input[name=chk_irp]:checked");
		
		// 체크박스는 1건만..
		if( checkbox.length > 1 ) {
			alert("삭제는 1건만 가능합니다.");
			$("input:checkbox[id='chk']").attr("checked", false);
			$("input:checkbox[id='chk_loan']").attr("checked", false);
			$("input:checkbox[id='chk_irp']").attr("checked", false);
			return;
			
		} else if( checkbox.length == 0 ) {
			alert("삭제할 건을 선택하세요.");
			return;
		}
		
		// 체크된 체크박스 값을 가져온다
		checkbox.each(function(i) {
			
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
			var clientId = td.eq(2).text();
			var orgCode = td.eq(3).text();
			var accountNum = td.eq(4).text();
			
			document.getElementById('clientId_irp').value = clientId.trim();
			document.getElementById('orgCode_irp').value = orgCode.trim();
			document.getElementById('accountNum_irp').value = accountNum.trim();
			
		});
		
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		$.ajax({
			url: '/assetMngView/assetDeleteIrp',
			type: "POST",
			//dataType: "",
			data: {
					clientId : document.getElementById('clientId_irp').value,
					orgCode : document.getElementById('orgCode_irp').value,
					accountNum : document.getElementById('accountNum_irp').value
			},
			success: function(data){
					//alert(data);
					
					if( data == 0 ) {
						alert("기존 데이터가 존재하지 않습니다.");
						return;
					}
					
				console.log("success");
				history.go(0);
			},
			error: function (request, status, error){
				alert("status : " + status + ' - ' + "error : " + error);
				console.log("error");
			}
		});
	}

</script>

</html>