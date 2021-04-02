package com.gsitm.mydata.assetMng;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path="/assetMngView")
public class AssetMngController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final AssetMngMapper assetMngMapper;

	public AssetMngController(AssetMngMapper assetMngMapper) {
        this.assetMngMapper = assetMngMapper;
    }

	// 자산관리 컨트롤러
    @RequestMapping(value="/list") 
    public String assetMngView(@RequestParam Map<String, Object> param, Model model) {
    	
    	logger.info("=============자산관리=============" + param.get("assetMngValue"));
    	
    	param.put("clientId", param.get("assetMngValue"));
    	
    	List<Map<String, Object>> list = (List<Map<String, Object>>) assetMngMapper.findAll(param);
    	
    	// 20210329 dc13 생성
    	List<Map<String, Object>> listLoan = (List<Map<String, Object>>) assetMngMapper.findAllLoan(param);
    	List<Map<String, Object>> listIrp = (List<Map<String, Object>>) assetMngMapper.findAllIrp(param);
    	// 20210329 dc13 생성
    	
    	model.addAttribute("clientId", param.get("assetMngValue"));
    	model.addAttribute("list" , list);
    	
    	// 20210329 dc13 생성
    	model.addAttribute("listLoan" , listLoan);
    	model.addAttribute("listIrp" , listIrp);
    	// 20210329 dc13 생성

    	return "assetMngView";
    }
    
    // 자산관리 입력 컨트롤러
    @RequestMapping(value="/assetInsert") 
    public @ResponseBody int assetInsert(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============자산관리 입력=============");
    	 
    	int cnt = 0; 
    	cnt = assetMngMapper.findAssetMngCnt(param);
    	
    	logger.info("자산관리 입력 컨트롤러 ==============>>> " + cnt);
    	
    	if ( cnt == 0 ) {
    		assetMngMapper.assetInsert(param);
    	}
    	
    	return cnt;
    }
    
    // 20210329 dc13 생성
    // 대출 자산관리 입력 컨트롤러
    @RequestMapping(value="/assetInsertLoan") 
    public @ResponseBody int assetInsertLoan(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============대출 자산관리 입력=============");
    	 
    	int cnt = 0; 
    	cnt = assetMngMapper.findAssetMngLoanCnt(param);
    	
    	logger.info("대출 자산관리 입력 컨트롤러 ==============>>> " + cnt);
    	
    	if ( cnt == 0 ) {
    		assetMngMapper.assetInsertLoan(param);
    	}
    	
    	return cnt;
    }
    
    // 20210329 dc13 생성
    // 개인형IRP 자산관리 입력 컨트롤러
    @RequestMapping(value="/assetInsertIrp") 
    public @ResponseBody int assetInsertIrp(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============개인형IRP 자산관리 입력=============");
    	 
    	int cnt = 0; 
    	cnt = assetMngMapper.findAssetMngIrpCnt(param);
    	
    	logger.info("개인형IRP 자산관리 입력 컨트롤러 ==============>>> " + cnt);
    	
    	if ( cnt == 0 ) {
    		assetMngMapper.assetInsertIrp(param);
    	}
    	
    	return cnt;
    }
    
    // 자산관리 수정 컨트롤러
    @RequestMapping(value="/assetModify") 
    public @ResponseBody int assetModify(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============자산관리 수정=============");
  
    	int cnt = 0; 
    	
    	logger.info("============>>> " + param.get("clientId"));
    	logger.info("============>>> " + param.get("orgCode"));
    	logger.info("============>>> " + param.get("insuNum"));
    	logger.info("============>>> " + param.get("orgCodeC"));
    	logger.info("============>>> " + param.get("insuNumC"));
    	
//    	String orgCode = (String) param.get("orgCodeC");
//    	String insuNum = (String) param.get("insuNumC");
    	
//    	param.put("orgCode", orgCode);
//    	param.put("insuNum", insuNum);
//    	cnt = assetMngMapper.findAssetMngCnt(param); 
    	
//    	if ( cnt == 0 ) {
//    		param.put("orgCode", param.get("orgCode"));
//        	param.put("insuNum", param.get("insuNum"));
//        	param.put("orgCodeC", param.get("orgCodeC"));
//        	param.put("insuNumC", param.get("insuNumC"));
//    		logger.info("============>>> if " + cnt);
//    		assetMngMapper.assetModify(param);
//    	}

    	assetMngMapper.assetModify(param);
    		
    	return cnt;
    }
    
    // 20210329 dc13 생성
    // 대출 자산관리 수정 컨트롤러
    @RequestMapping(value="/assetModifyLoan") 
    public @ResponseBody int assetModifyLoan(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============대출 자산관리 수정=============");
  
    	int cnt = 0; 
    	
    	logger.info("============>>> " + param.get("clientId"));
    	logger.info("============>>> " + param.get("orgCode"));
    	logger.info("============>>> " + param.get("accountNum"));
    	logger.info("============>>> " + param.get("orgCodeC"));
    	logger.info("============>>> " + param.get("accountNumC"));

    	assetMngMapper.assetModifyLoan(param);
    		
    	return cnt;
    }
    
    // 20210329 dc13 생성
    // 개인형IRP 자산관리 수정 컨트롤러
    @RequestMapping(value="/assetModifyIrp") 
    public @ResponseBody int assetModifyIrp(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============개인형IRP 자산관리 수정=============");
  
    	int cnt = 0; 
    	
    	logger.info("============>>> " + param.get("clientId"));
    	logger.info("============>>> " + param.get("orgCode"));
    	logger.info("============>>> " + param.get("accountNum"));
    	logger.info("============>>> " + param.get("orgCodeC"));
    	logger.info("============>>> " + param.get("accountNumC"));

    	assetMngMapper.assetModifyIrp(param);
    		
    	return cnt;
    }    
    
    // 자산관리 삭제 컨트롤러
    @RequestMapping(value="/assetDelete") 
    public @ResponseBody int assetDelete(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============자산관리 삭제=============");
    	
    	int cnt = 0; 
    	cnt = assetMngMapper.findAssetMngCnt(param); 
    	
    	if ( cnt > 0 ) {
    		assetMngMapper.assetDelete(param);
    	}

    	return cnt;
    }
 
    // 20210329 dc13 생성
    // 대출 자산관리 삭제 컨트롤러
    @RequestMapping(value="/assetDeleteLoan") 
    public @ResponseBody int assetDeleteLoan(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============대출 자산관리 삭제=============");
    	
    	int cnt = 0; 
    	cnt = assetMngMapper.findAssetMngLoanCnt(param); 
    	
    	if ( cnt > 0 ) {
    		assetMngMapper.assetDeleteLoan(param);
    	}

    	return cnt;
    }
    
    // 20210329 dc13 생성
    // 개인형IRP 자산관리 삭제 컨트롤러
    @RequestMapping(value="/assetDeleteIrp") 
    public @ResponseBody int assetDeleteIrp(@RequestParam Map<String, Object> param) {
    	
    	logger.info("=============개인형IRP 자산관리 삭제=============");
    	
    	int cnt = 0; 
    	cnt = assetMngMapper.findAssetMngIrpCnt(param); 
    	
    	if ( cnt > 0 ) {
    		assetMngMapper.assetDeleteIrp(param);
    	}

    	return cnt;
    }
    
}
