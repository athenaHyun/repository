package com.gsitm.mydata.system.kakao;
 
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kakaocert.api.KakaocertException;

@Controller
public class KakaoCertController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 고객입력 정보 컨트롤러
    @RequestMapping(value="/cusInform") 
    public String cusInform() {
    	//logger.info("=============고객 입력 정보=============");
    	return "cusInform";
    }
	
	// 본인인증 요청 컨트롤러
    @RequestMapping(value="/requestVerifyAuth")
    public String requestVerifyAuth(HttpServletRequest request, Model model) throws KakaocertException { 
    	
//    	String name       = request.getParameter( "name"       );	
//    	String birthDay   = request.getParameter( "birthDay"   );	
//    	String phoneNum   = request.getParameter( "phoneNum"   );	
//    	String requestMsg = request.getParameter( "requestMsg" );	
    	
//    	logger.info("=============성명============="               + name       );
//    	logger.info("=============생일============="               + birthDay   );
//    	logger.info("=============휴대폰번호============="         + phoneNum   );
//    	logger.info("=============인증요청부가메세지=============" + requestMsg );
    	
//    	String id = "021010000014";
    	
//    	model.addAttribute( "clientCode" , id );  // 아데나소프트 파트너 ID
//    	model.addAttribute( "name"       , name           );  // 성명
//    	model.addAttribute( "birthDay"   , birthDay       );  // 생일
//    	model.addAttribute( "phoneNum"   , phoneNum       );  // 휴대폰번호
//    	model.addAttribute( "requestMsg" , requestMsg     );  // 인증요청부가메세지
    	
//    	logger.info("=============clientCode============="               + model.getAttribute("clientCode") );
    	
    	return "requestVerifyAuth"; 
    }
  
    // 서명상태확인 컨트롤러    
    @RequestMapping(value="/getVerifyAuthState") 
    public String getVerifyAuthState(HttpServletRequest request, Model model, HttpServletRequest pageContext) throws KakaocertException {
    	
    	//logger.info("=============getVerifyAuthState============="               + request.getSession().getAttribute("name") );
    	
    	String receiptID = (String) pageContext.getSession().getAttribute("receiptID");
    	
    	String receiverName = (String) pageContext.getSession().getAttribute("receiverName");
    	String receiverBirthDay = (String) pageContext.getSession().getAttribute("receiverBirthDay");
    	String receiverHP = (String) pageContext.getSession().getAttribute("receiverHP");
    		
    	model.addAttribute("receiptID", receiptID);
    	
    	model.addAttribute("receiverName", receiverName);
    	model.addAttribute("receiverBirthDay", receiverBirthDay);
    	model.addAttribute("receiverHP", receiverHP);
    	
    	return "getVerifyAuthState";
    }
    
    // 서명검증 컨트롤러
    @RequestMapping(value="/verifyAuth") 
    public String verifyAuth(HttpServletRequest request, Model model, HttpServletRequest pageContext) throws KakaocertException {

    	String receiptID = (String) pageContext.getSession().getAttribute("receiptID");
    	
    	String receiverName = (String) pageContext.getSession().getAttribute("receiverName");
    	String receiverBirthDay = (String) pageContext.getSession().getAttribute("receiverBirthDay");
    	String receiverHP = (String) pageContext.getSession().getAttribute("receiverHP");
    	
    	model.addAttribute("receiptID", receiptID);
    	
    	model.addAttribute("receiverName", receiverName);
    	model.addAttribute("receiverBirthDay", receiverBirthDay);
    	model.addAttribute("receiverHP", receiverHP);
    	
    	return "verifyAuth"; 
    }
 
}