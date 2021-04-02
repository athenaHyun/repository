<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/css/main.css" media="screen" />
		<title>kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.kakaocert.api.KakaocertException"%>
<%@page import="com.kakaocert.api.verifyauth.ResultVerifyAuth"%>

<%
	/*
	 * 본인인증 요청시 반환된 접수아이디를 통해 서명 상태를 확인합니다.
	 */

  	// 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
  	String ClientCode = "021010000014"; // 021010000014	

	// 본인인증 요청시 반환된 접수아이디
	String receiptID = (String) request.getAttribute("receiptID");
  	
	String receiverName = (String) request.getAttribute("receiverName");
	String receiverBirthDay = (String) request.getAttribute("receiverBirthDay");
	String receiverHP = (String) request.getAttribute("receiverHP");
	
    ResultVerifyAuth result = null;

	try {
		
		// 최조1회 호출 후 30간격으로 호출
		while(true){
			
			result = null;
			
	    	result = kakaocertService.getVerifyAuthState(ClientCode, receiptID);
		    	
			// 0:진행중, 1:성공, 2:실패
			// result.getState()가 성공(1)이면 서명검증(verifyAuth)페이지로 점수아이디와 함계 이동
	    	if( result.getState() == 1 ) {
	    		
	    		//Thread.interrupted();

	    		// 서명검증 페이지로 receiptID를 넘겨주기 위한 설정
	    		pageContext.getSession().setAttribute("receiptID", receiptID);
	    		
	    		pageContext.getSession().setAttribute("receiverName", receiverName);
	    		pageContext.getSession().setAttribute("receiverBirthDay", receiverBirthDay);
	    		pageContext.getSession().setAttribute("receiverHP", receiverHP);
	    		
	    		// 서명검증 페이지로 이동
	    		response.sendRedirect("/verifyAuth");
	    		
	    		break;

	    	// result.getState()가 실패(2)이면 반목문을 빠져나간다.
	    	} else if( result.getState() == 2 ) {
		    		
 	    		//Thread.interrupted();
 	    		
 	    		response.sendRedirect("/consentStep1");
 	    		
	    		break;
	    		
	    	}

	    	//30초 동안 멈춤
	    	Thread.sleep(30000);
		}
		

	} catch(KakaocertException ke) {
    		throw ke;
  	} catch(InterruptedException e) {
  		Thread.currentThread().interrupt();
        System.out.println("Thread was interrupted");
  	} 
%>

	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>본인인증 서명상태 확인</legend>
				<ul>
					<li>receiptID(접수아이디) : <%= result.getReceiptID()%></li>
		        	<li>clientCode (이용기관코드) : <%= result.getClientCode()%></li>
		        	<li>clientName (이용기관명) : <%= result.getClientName()%></li>
		        	<li>subClientName (별칭) : <%= result.getSubClientName()%></li>
		        	<li>subClientCode (별칭코드) : <%= result.getSubClientCode()%></li>
		        	<li>state (상태) : <%= result.getState()%></li>
		
		        	<li>expires_in (인증요청 만료시간(초)	) : <%= result.getExpires_in()%></li>
			        <li>callCenterNum(고객센터 전화번호) : <%= result.getCallCenterNum()%></li>
			        <li>tmstitle (인증요청 메시지 제목) : <%= result.getTmstitle()%></li>
			        <li>tmsmessage (인증요청 메시지 부가내용) : <%= result.getTmsmessage()%></li>
			        <li>allowSimpleRegistYN	(은행계좌 실명확인 생략여부) : <%= result.isAllowSimpleRegistYN()%></li>
			        <li>verifyNameYN (수신자 실명확인 여부) : <%= result.isVerifyNameYN()%></li>
			        <li>requestDT (카카오 인증서버 등록일시) : <%= result.getRequestDT()%></li>
			        <li>expireDT (인증 만료일시) : <%= result.getExpireDT()%></li>
			        <li>regDT (인증요청 등록일시) : <%= result.getRegDT()%></li>
			        <li>viewDT (수신자 카카오톡 인증메시지 확인일시) : <%= result.getViewDT()%></li>
			        <li>completeDT (수신자 카카오톡 전자서명 완료일시	) : <%= result.getCompleteDT()%></li>
			        <li>verifyDT (서명 검증일시) : <%= result.getVerifyDT()%></li>
			        <li>payload (payload) : <%= result.getPayload()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
