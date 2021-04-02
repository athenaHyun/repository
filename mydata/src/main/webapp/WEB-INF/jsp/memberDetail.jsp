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
	border: 1px solid #bbbbbb;
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
<title>회원목록</title>

<script src="/common/js/jquery-1.11.1.min.js"></script>
<script src="/common/js/jquery-ui.js"></script>
<script type="text/javascript">


	$(document).ready(function() {
		document.getElementById("back_btn").onclick = function() {
		    location.href="/consentStep1";	    
		}
		
	});
	
	//체크박스 선택시 1개만 선택
	function doOpenCheck(chk){
	    var obj = document.getElementsByName("members");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }
	    }
	}
	//회원삭제
	function deleteMember() {
	
		var isDelete = null;
		
		var obj_length = document.getElementsByName("members").length;
       	
       	for (var i=0; i<obj_length; i++) {
           	if ($("input:checkbox[name=members]").is(":checked") == true) {
               
               //memberFrm.deletePrm.value = document.getElementsByName("members")[i].value;
               $("#deletePrm").val($("input:checkbox[name=members]:checked").val());
               isDelete = confirm($("#deletePrm").val() + " 님을 삭제 하시겠습니까?");
               
               if (isDelete == true) {
	               memberFrm.action = "/member/delete";
	               memberFrm.submit();
	               return false;
               } else {
               		return false;	
               }
           	}
           	alert("삭제할 회원을 선택하세요.");
           	return false;
       	} 
    }
    
    // 모달창 띄우기
    function addMember() {
    	//var winPop = window.open("/memberAddPop","_blank", "width=500,height=600");
    	$("#clientId").val('');
    	$("#birth").val('');
    	$("#name").val('');
    	$("#hp").val('');
    	$('#modal').css("display", "block");
    	
    }
    
    //중복체크 flag
    var isChkId = 0;
    
    // 클라이언트id중복 체크
    function dupCheckId() {
		
		isChkId = 0;
		if ($("#clientId").val() == "" || $("#clientId").val() == null || $("#clientId").val() == undefined ) {
			alert("id를 입력해주세요");
			document.getElementById('clientId').focus();
			return;
		} else {
			$("#compareId").val(document.getElementById('clientId').value);
			$.ajax({
				url: '/member/chkId',
				type: "POST",
				//dataType: "",
				data: {
						clientId : document.getElementById('clientId').value
				},
				success: function(data){
	 				//alert(data);
	 				
	 				if( data > 0 ) {
						alert("중복되는 아이디 입니다.");
						document.getElementById('clientId').value = "";
						document.getElementById('clientId').focus();
						isChkId = 2;
						return;
					} else {
						alert("사용가능한 아이디 입니다.");
						document.getElementById('birth').focus();
						//$( '#modalSendBtn' ).removeAttr( 'disabled' );
						isChkId = 1;
						return;
					}
					//console.log("success");
					//history.go(0);
				},
				error: function (request, status, error){
					alert("status : " + status + ' - ' + "error : " + error);
					console.log("error");
				}
			});
			//isChkId = 0;
			//return;
		}
    	
    }
    //회원추가
    function addMemberSubmit() {
    	
    	if ($("#clientId").val() == "" || $("#clientId").val() == null || $("#clientId").val() == undefined) {
    		alert("client id는 입력해주세요.");
    		document.getElementById('clientId').value = "";
    		document.getElementById('clientId').focus();
    		return;
    	}
    	if ($("#birth").val() == "" || $("#birth").val() == null || $("#birth").val() == undefined) {
    		alert("생일을 입력해주세요.");
    		document.getElementById('birth').value = "";
    		document.getElementById('birth').focus();
    		return;
    	}
    	if ($("#name").val() == "" || $("#name").val() == null || $("#name").val() == undefined) {
    		alert("이름을 입력해주세요.");
    		document.getElementById('name').value = "";
    		document.getElementById('name').focus();
    		return;
    	}
    	if ($("#hp").val() == "" || $("#hp").val() == null || $("#hp").val() == undefined) {
    		alert("휴대폰번호를 입력해주세요.");
    		document.getElementById('hp').value = "";
    		document.getElementById('hp').focus();
    		return;
    	}
    	
   		if (isChkId == 0) {
   			alert("중복체크를 해주세요.");
   			$("#dupChkId").focus();
   			return;
    	} else if (isChkId == 2) {
    		alert("중복되는 아이디 입니다.");
    		//isChkId == 0;
    		document.getElementById('clientId').value = "";
	    	document.getElementById('clientId').focus();
    		return;
    	// 중복체크 flag가 1이라도 검사한를 마친 id와 현재 입력된 id가 다르다면 중복체크를 다시함.
    	} else if (isChkId == 1 && $("#compareId").val() != document.getElementById('clientId').value) {
    		alert("중복체크를 해주세요.");
   			$("#dupChkId").focus();
   			return;
    	}
	    	
    	$("#clientId_submit").val($("#clientId").val());
    	$("#birth_submit").val($("#birth").val());
    	$("#name_submit").val($("#name").val());
    	$("#hp_submit").val($("#hp").val());
		
		var isConform = confirm($("#clientId_submit").val() + " 님을(를) 추가하시겠습니까?");
		if (isConform == true) {
			document.addMemberSubmit.action = "/member/add";
			document.addMemberSubmit.submit();
			alert("사용자가 추가되었습니다.");
			isChkId = 0;
			$('#modal').css("display", "none");
			
		} else if (isConform == false) {
			alert("사용자 추가가 취소되었습니다");
			isChkId = 0;
			$('#modal').css("display", "none");
		}
    	
    }
    // 모달창 닫기
    function closeModal() {
    	$('#modal').css("display", "none");
    }
    
    // 자산관리 연동
    function fn_assetMng(clientId) {
        
        document.getElementById('assetMngValue').value = clientId;
        memberFrm.method = 'post'
    	memberFrm.action = "/assetMngView/list";
        memberFrm.submit();
    }
	
    
</script>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			<span style="font-size: 20px;">본인동의 회원정보</span><br/>
			<div style="width:500px;">
				<table border="1">
					<thead>
						<tr>
							<th align="center">선택</th>
							<th align="center">클라이언트ID</th>
							<th align="center">생일</th>
							<th align="center">이름</th>
							<th align="center">휴대폰번호</th>
							<th align="center">자산관리</th>
						</tr>
					</thead>
					<c:forEach var="memberList" items="${memberDetailList}" varStatus="status">
						<tr>
							<td align="center"><label><input onclick="javascript:doOpenCheck(this);" style='zoom:1.5;' type="checkbox" name="members" value="${memberList.clientId}"></label></td>
							<td><c:out value="${memberList.clientId}" /></td>
							<td><c:out value="${memberList.birth}" /></td>
							<td><c:out value="${memberList.name}" /></td>
							<td><c:out value="${memberList.hp}" /></td>
							<td align="center"><a href="javascript:fn_assetMng('<c:out value='${memberList.clientId}' />');">이동</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="text-align:right;">
				<button class="small_btn" onclick='javascript:deleteMember();'>삭제</button>
				<button class="small_btn" onclick='javascript:addMember();'>추가</button>
			</div>
			<div align="right" style="margin-top:10px;">
			 	<button class="btn" type="button" id="back_btn" style="font-size: 12px;">전송요구 동의<br/>페이지로 이동</button>
			 </div>
			<div id="modal">
				<div class="modal_content">
					<span style="font-size: 15px;">본인동의 회원 정보 입력</span>
					<table border="1">
					<tbody>
						<tr>
							<td>ClientId</td>
							<td>
								<input name="clientId" id="clientId" type="text" style="width:70%" /><button onclick="dupCheckId();" id="dupChkId">중복체크</button>
							</td>
						</tr>
						<tr>
							<td>생일</td>
							<td><input name="birth" id="birth" type="text" style="width:100%" /></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input name="name" id="name" type="text" style="width:100%" /></td>
						</tr>
						<tr>
							<td>휴대폰번호</td>
							<td><input name="hp" id="hp" type="text" style="width:100%" /></td>
						</tr>
					</tbody>					
					</table>
					<div align="center">
						<button class="small_btn" onclick="location.href='javascript:addMemberSubmit();'" style="color: white; background: #000000;" id="modalSendBtn">추가</button>
						<button class="small_btn" onclick="location.href='javascript:closeModal();'" style="color: white; background: #000000;" id="modalSendBtn">닫기</button>
					</div>
				</div>
				<div class="modal_layer"></div>
		 	</div>
		</div>
	</div>
<form id="memberFrm" name="memberFrm" method="post">
	<input type="hidden" id="deletePrm" name="deletePrm" value="" />
	<input type="hidden" id="assetMngValue" name="assetMngValue" value="" />
</form>
<form id="addMemberSubmit" name="addMemberSubmit" method="post">
	<input type="hidden" id="clientId_submit" name="clientId_submit" value="" />
	<input type="hidden" id="birth_submit" name="birth_submit" value="" />
	<input type="hidden" id="name_submit" name="name_submit" value="" />
	<input type="hidden" id="hp_submit" name="hp_submit" value="" />
	<input type="hidden" id="compareId" name="compareId" value="" />
</form>
</body>
</html>