<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/css/main.css" media="screen" />
		<title>kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.kakaocert.api.KakaocertException"%>
<%@page import="com.kakaocert.api.VerifyResult"%>

<%
	/*
	 * 본인인증 요청시 반환된 접수아이디를 통해 서명을 검증합니다.
   * - 서명검증시 전자서명 데이터 전문(signedData)이 반환됩니다.
   * - 본인인증 요청시 작성한 Token과 서명 검증시 반환되는 signedData의 동일여부를 확인하여 본인인증 검증을 완료합니다.
   * - 카카오페이 API 서비스 운영정책에 따라 검증 API는 1회만 호출할 수 있습니다. 재시도시 오류처리됩니다.
	 */

  	// 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
  	String ClientCode = "021010000014";

	// 본인인증 요청시 반환된 접수아이디
	String receiptID = (String) request.getAttribute("receiptID");
	
	String receiverName = (String) request.getAttribute("receiverName");
	String receiverBirthDay = (String) request.getAttribute("receiverBirthDay");
	String receiverHP = (String) request.getAttribute("receiverHP");

  	VerifyResult result = null;

	try {

    	result = kakaocertService.verifyAuth(ClientCode, receiptID);
    	
    	// 서명검증 페이지로 receiptID를 넘겨주기 위한 설정
		pageContext.getSession().setAttribute("receiptID", receiptID);
    	
		pageContext.getSession().setAttribute("receiverName", receiverName);
		pageContext.getSession().setAttribute("receiverBirthDay", receiverBirthDay);
		pageContext.getSession().setAttribute("receiverHP", receiverHP);
    	
		// 개인신용정보 전송 동의 Step1
		response.sendRedirect("/consentStep3");

	} catch(KakaocertException ke) {
    	throw ke;
  }
%>

	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>본인인증 서명검증</legend>
				<ul>
		          <li>접수아이디 (receiptId) : <%=result.getReceiptId()%></li>
		          <li>전자서명 데이터 전문 (signedData) : <%=result.getSignedData()%></li>
		          
		          <li>이름 : <%=receiverName%></li>
		          <li>생일 : <%=receiverBirthDay%></li>
		          <li>전화번호 : <%=receiverHP%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
