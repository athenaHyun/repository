package com.gsitm.mydata.api.insu.basic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/")
public class InsuBasicController {

    @Autowired
    private InsuBasicRepository InsuBasicRepository;
    
    @Autowired
    private InsuBasicMapper insuBasicMapper;
    
    @GetMapping(path="/insuBasic")
    public ResponseEntity<Map<?,?>> getInsuBasicList(){
        
//        InsuBasicRepository.findAll().forEach(InsuBasic -> insuList.add(InsuBasic.getInsuredList()));
        
        List<Map<String, String>> insuListNew = new ArrayList<>();
        List<InsuBasic> insuList = new ArrayList<>();
        Map map = new HashMap();
        InsuBasicRepository.findAll().forEach(insuList::add);
        System.out.println("insuList count :"+ insuList.size());
        for(int i = 0; i < insuList.size(); i++) {
        	map = new HashMap();
        	
        	map.put("is_renewabletiny", insuList.get(i).getIsRenewable());
        	map.put("issue_datedate", insuList.get(i).getIssueDate());
        	map.put("exp_datedate", insuList.get(i).getExpDate());
        	map.put("face_amtfloat", insuList.get(i).getFaceAmt());
        	map.put("currency_code", insuList.get(i).getCurrencyCode());
        	map.put("is_variabletiny", insuList.get(i).getIsVariable());
        	map.put("is_universaltiny", insuList.get(i).getIsUniversal());
        	map.put("pension_rcv_start_date", insuList.get(i).getPensionRcvStartDate());
        	map.put("is_variable", insuList.get(i).getIsVariable());
        	map.put("insured_count", insuList.get(i).getInsuredCount());
        	map.put("insured_list", insuList.get(i).getInsuredList());
        	
        	insuListNew.add(map);
        }
        
        
        Map<String, Object> response = new HashMap<>();
        response.put("rsp_code", HttpStatus.OK.series());
        response.put("rsp_msg", HttpStatus.OK.value());
        response.put("data count", map.size());
        response.put("data", insuListNew);
        
        return new ResponseEntity<>(response, HttpStatus.OK);
    } 
    
    // mydata-pjc  
    @GetMapping(path="/insuBasic2")
    public ResponseEntity<?> getApiById() {
        List<InsuBasic> list = insuBasicMapper.findById(null);
        
        Map<String, Object> response = new HashMap<>();
        response.put("rsp_code", HttpStatus.OK.series());
        response.put("rsp_msg", HttpStatus.OK.value());
        response.put("data count", list.size());
        response.put("data", list);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }
}
