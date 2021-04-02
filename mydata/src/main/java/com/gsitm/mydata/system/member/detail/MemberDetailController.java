package com.gsitm.mydata.system.member.detail;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path="/member")
public class MemberDetailController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MemberDetailListMapper memberDetailListMapper;

    public MemberDetailController(MemberDetailListMapper memberDetailListMapper) {
        this.memberDetailListMapper = memberDetailListMapper;
    }
	
	// 본인인증 회원관리 불러오기
    @RequestMapping(value="/detail")
    public String getMemberDetailList(Model model) throws Exception { 
    	
    	List<MemberDetailListDto> memberDetails = memberDetailListMapper.findAll();
    	model.addAttribute("memberDetailList", memberDetails);
    	
    	return "memberDetail"; 
    }
    
    // 본인인증 회원관리 불러오기
    @RequestMapping(value="/delete")
    public String deleteMember(HttpServletRequest request, Model model) throws Exception { 
    	
    	String clientId       = request.getParameter( "deletePrm"       );	// 클라이언트id
    	memberDetailListMapper.delete(clientId);
    	memberDetailListMapper.deleteMember(clientId);
    	
    	List<MemberDetailListDto> memberDetails = memberDetailListMapper.findAll();
    	model.addAttribute("memberDetailList", memberDetails);
    	
    	return "redirect:/member/detail";
    }
    //clientId 중복체크
    @RequestMapping(value="/chkId")
    public @ResponseBody int memberChkId(@RequestParam Map<String, Object> param, Model model) throws Exception { 
    	
    	logger.info("================= memberChkId =================");
    	logger.info("================= clientId: " + param.get("clientId"));
    	
    	int cnt = 0;
    	int cntMember = 0;
    	int sumCnt = 0;
    	
    	cnt = memberDetailListMapper.countId(param);
    	cntMember = memberDetailListMapper.countIdMember(param);
    	
    	sumCnt = cnt + cntMember;
    	
    	return sumCnt;
    }
    
    // 회원추가
    @RequestMapping(value="/add")
    public String memberAdd(HttpServletRequest request, Model model) throws Exception { 
    	
    	logger.info("@@@@@@@@@@ memberAdd");

    	String ClientId       	= request.getParameter( "clientId_submit"       );	// 클라이언트id
    	String birth       		= request.getParameter( "birth_submit"       );		// 생일
    	String name       		= request.getParameter( "name_submit"       );		// 이름
    	String hp       		= request.getParameter( "hp_submit"       );		// 휴대폰
    	
    	MemberDetailListDto memberDetailListDto = MemberDetailListDto.builder()
                .clientId(ClientId)
                .birth(birth)
                .name(name)
                .hp(hp)
                .build();
    	
    	memberDetailListMapper.addMember(memberDetailListDto);
    	memberDetailListMapper.addMemberDetail(memberDetailListDto);
    	
    	List<MemberDetailListDto> memberDetails = memberDetailListMapper.findAll();
    	model.addAttribute("memberDetailList", memberDetails);
    	
    	return "redirect:/member/detail";
    }
 
}