package com.gsitm.mydata.consentStep;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gsitm.mydata.system.member.detail.MemberDetailListMapper;

@Controller
public class ConsentStepController {

	@Autowired
	private ConsentStepInsuMapper consentStepInsuMapper;
	
	@Autowired
	private ConsentStepLoanMapper consentStepLoanMapper;
	
	@Autowired
	private ConsentStepIrpMapper consentStepIrpMapper;
	
	@Autowired
	private MemberDetailListMapper memberDetailListMapper;

	// 개인신용정보 전송 동의 Step1
	@RequestMapping(value="/consentStep1")
	public String consentStep1(HttpServletRequest request, Model model, HttpServletRequest pageContext) throws Exception {
		return "consentStep1";
	}
	
	// 개인신용정보 전송 동의 Step2
	@RequestMapping(value="/consentStep2")
	public String consentStep2() throws Exception {
		return "consentStep2";
	}
	
	// 개인신용정보 전송 동의 Step3
	@RequestMapping(value="/consentStep3")
	public String consentStep3(Model model, HttpServletRequest pageContext) throws Exception {
		
		String receiptID = (String) pageContext.getSession().getAttribute("receiptID");
		
		String receiverName = (String) pageContext.getSession().getAttribute("receiverName");
    	String receiverBirthDay = (String) pageContext.getSession().getAttribute("receiverBirthDay");
    	String receiverHP = (String) pageContext.getSession().getAttribute("receiverHP");
    	
    	model.addAttribute("receiptID", receiptID);
    	
    	HashMap<String, Object> param = new HashMap<>();
    	param.put("birth", receiverBirthDay);
    	param.put("name", receiverName);
    	param.put("hp", receiverHP);
    	
    	int clientCnt = memberDetailListMapper.findHavingClient(param);
    	if (clientCnt == 1) {
			model.addAttribute("receiverName", receiverName);
			model.addAttribute("receiverBirthDay", receiverBirthDay);
			model.addAttribute("receiverHP", receiverHP);
			
			String clientId = "saint@gstim.com";    	    	
			List<ConsentStepInsuDto> insuList = consentStepInsuMapper.findById(clientId);
			List<ConsentStepLoanDto> loanList = consentStepLoanMapper.findById(clientId);
			List<ConsentStepIrpDto> irpList = consentStepIrpMapper.findById(clientId);
			
			model.addAttribute("insuList", insuList);
			model.addAttribute("loanList", loanList);
			model.addAttribute("irpList", irpList);
    	}
    	
    	model.addAttribute("clientCnt", clientCnt);
    	
		return "consentStep3";
	}
	
	// 개인신용정보 전송 동의 Step4
	@RequestMapping(value="/consentStep4")
	public String consentStep4(@RequestParam(value="sendClientId", required=true) String customerId,
			@RequestParam(value="sendInsuNum", required=false) List<String> insuNumList,
			@RequestParam(value="sendLoanAccountNum", required=false) List<String> loanAccountNumList,
			@RequestParam(value="sendIrpAccountNum", required=false) List<String> irpAccountNumList,
			Model model) throws Exception {
		
		System.out.println("CustomerId" + customerId);
		
		consentStepInsuMapper.deleteConsents(customerId);
		
		if (insuNumList != null) {
			for (String insuNum : insuNumList) {
				//System.out.println("insuNum [" + insuNum + "]");
				consentStepInsuMapper.insertConsents(customerId, insuNum);
			}
		}		
		if (loanAccountNumList != null) {			
			for (String accountNum : loanAccountNumList) {
				//System.out.println("loanAccountNum [" + loanAccountNum + "]");
				consentStepLoanMapper.insertConsents(customerId, accountNum);
			}
		}
		if (irpAccountNumList != null) {
			for (String accountNum : irpAccountNumList) {
				//System.out.println("irpAccountNum [" + irpAccountNum + "]");
				consentStepIrpMapper.insertConsents(customerId, accountNum);
			}
		}
		
		String clientId = customerId;
		
		List<ConsentStepInsuDto> insuList = consentStepInsuMapper.findScheduledById(clientId);
    	List<ConsentStepLoanDto> loanList = consentStepLoanMapper.findScheduledById(clientId);
    	List<ConsentStepIrpDto> irpList = consentStepIrpMapper.findScheduledById(clientId);
    	
    	model.addAttribute("insuList", insuList);
    	model.addAttribute("loanList", loanList);
    	model.addAttribute("irpList", irpList);
		
		return "consentStep4";
	}
}
