<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="/css/main.css" media="screen" />
		<title>Kakaocert SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.kakaocert.api.verifyauth.RequestVerifyAuth"%>
<%@page import="com.kakaocert.api.KakaocertException"%>

<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>

<%

  Logger logger = LoggerFactory.getLogger(this.getClass());

  /*
   * 카카오톡 사용자에게 본인인증 서명을 요청합니다.
  */

  String clientCode = request.getParameter("clientCode" );	// 아데나소프트 파트너 ID
  String name 		= request.getParameter("name"		);	// 성명
  String birthDay 	= request.getParameter("birthDay"   );	// 생일
  String phoneNum 	= request.getParameter("phoneNum"   );	// 휴대폰번호
  String requestMsg = request.getParameter("requestMsg" );	// 인증요청부가메세지
  
  logger.info("========================>>> clientCode " + clientCode );
  logger.info("========================>>> name "       + name       );
  logger.info("========================>>> birthDay "   + birthDay   );
  logger.info("========================>>> phoneNum "   + phoneNum   );
  logger.info("========================>>> requestMsg " + requestMsg );

  // 이용기관코드, 파트너가 등록한 이용기관의 코드, (파트너 사이트에서 확인가능)
  //String ClientCode = "021010000014"; // 021010000014

  // 본인인증 요청 정보 Object
  RequestVerifyAuth requestObj = new RequestVerifyAuth();
  
  //수신자 성명
  requestObj.setReceiverName(name);
 
  // 수신자 생년월일, 형식 : YYYYMMDD
  requestObj.setReceiverBirthDay(birthDay);

  // 수신자 휴대폰번호
  requestObj.setReceiverHP(phoneNum);

  // 인증요청 메시지 부가내용, 카카오톡 인증메시지 중 상단에 표시
  requestObj.setTMSMessage(requestMsg);

  // 고객센터 전화번호, 카카오톡 인증메시지 중 "고객센터" 항목에 표시
  requestObj.setCallCenterNum("1600-9999");

  // 인증요청 만료시간(초), 최대값 : 1000,	인증요청 만료시간(초) 내에 미인증시, 만료 상태로 처리됨
  requestObj.setExpires_in(60);

  // 별칭코드, 이용기관이 생성한 별칭코드 (파트너 사이트에서 확인가능)
  // 카카오톡 인증메시지 중 "요청기관" 항목에 표시
  // 별칭코드 미 기재시 이용기관의 이용기관명이 "요청기관" 항목에 표시
  requestObj.setSubClientID("");

  // 인증요청 메시지 제목, 카카오톡 인증메시지 중 "요청구분" 항목에 표시
  requestObj.setTMSTitle("TMS Title");

  // Token 원문, 보안을 위해 1회용으로 생성
	// 인증완료시, getVerifyAuthResult API의 returnToken 항목값으로 반환
  requestObj.setToken("20200504-001");

  /*
  * 은행계좌 실명확인 생략여부
  * true : 은행계좌 실명확인 절차를 생략
  * false : 은행계좌 실명확인 절차를 진행
  *
  * - 인증메시지를 수신한 사용자가 카카오인증 비회원일 경우,
  *   카카오인증 회원등록 절차를 거쳐 은행계좌 실명확인 절차이후 전자서명 가능
  */
  requestObj.setAllowSimpleRegistYN(false);

  /*
  * 수신자 실명확인 여부
  * true : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 ReceiverName 값을 비교
  * false : 카카오페이가 본인인증을 통해 확보한 사용자 실명과 RecevierName 값을 비교하지 않음.
  */
  requestObj.setVerifyNameYN(true);

  // PayLoad, 이용기관이 API 요청마다 생성한 payload(메모) 값
  requestObj.setPayLoad("memo Info");

  String receiptID = null;

  	try {
  		
  		// 접수ID를 받음
		receiptID = kakaocertService.requestVerifyAuth(clientCode, requestObj);
  		
		// receiptID를 서명상태확인 페이지로 넘겨주기 위한 설정
		pageContext.getSession().setAttribute("receiptID", receiptID);
		
		//request.getSession().setAttribute("name", name);
		
		pageContext.getSession().setAttribute("receiverName", requestObj.getReceiverName());
		pageContext.getSession().setAttribute("receiverBirthDay", requestObj.getReceiverBirthDay());
		pageContext.getSession().setAttribute("receiverHP", requestObj.getReceiverHP());
		
		// 서명상태페이지로 이동
		response.sendRedirect("/getVerifyAuthState");

	} catch (KakaocertException ke) {
		throw ke;
	}
%>

	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>본인인증 요청</legend>
				<ul>
					<li>접수아이디 : <%=receiptID%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>