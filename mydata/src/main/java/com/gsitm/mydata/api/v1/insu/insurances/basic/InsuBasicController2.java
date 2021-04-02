package com.gsitm.mydata.api.v1.insu.insurances.basic;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javassist.NotFoundException;

@RestController
@RequestMapping(path="/insurances/basic")
public class InsuBasicController2 {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuBasicListMapper insuBisicListMapper;

    public InsuBasicController2(InsuBasicListMapper insuBisicListMapper) {
        this.insuBisicListMapper = insuBisicListMapper;
    }

    @PostMapping
    public ResponseEntity getBasicList(@RequestBody Param params) throws NotFoundException {
    	
    	InsuBasicDto insuBasicDto = InsuBasicDto.builder()
    			.orgCode(params.getOrgCode())
    			.build();
    	
    	logger.info("===== orgCode: "+params.getOrgCode());
    	logger.info("===== searchTimestamp: "+params.getSearchTimestamp());
    	logger.info("===== insuNum: "+params.getInsuNum());
    	
    	List<InsuBasicDto> basics = insuBisicListMapper.findAll(insuBasicDto);
    	
        InsuBasicListDto responseBody = InsuBasicListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .searchTimestamp("20210316")
                .isRenewable("Y")
                .issueDate("20210301")
                .expDate("20210331")
                .faceAmt("5000000")
                .currencyCode("KWR")
                .isVariable("false")
                .isUniversal("true")
                .pensionRcvStartDate("20210301")
                .pensionRecCycle("1M")
                .isLoanable("true")
                .insuredCount(basics.size())
                .insuredList(basics)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}