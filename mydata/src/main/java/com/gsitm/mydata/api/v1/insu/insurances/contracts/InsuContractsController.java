package com.gsitm.mydata.api.v1.insu.insurances.contracts;

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
@RequestMapping(path="/insurances/contracts")
public class InsuContractsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuContractsListMapper insuContractsListMapper;

    public InsuContractsController(InsuContractsListMapper insuContractsListMapper) {
        this.insuContractsListMapper = insuContractsListMapper;
    }

    @PostMapping
    public ResponseEntity getContractsList(@RequestBody Params params) throws NotFoundException {
    	
    	InsuContractsDto insuContractsDto = InsuContractsDto.builder()
    			.orgCode(params.getOrgCode())
    			.build();
    	
    	logger.info("===== orgCode: "+params.getOrgCode());
    	logger.info("===== searchTimestamp: "+params.getSearchTimestamp());
    	logger.info("===== insuNum: "+params.getInsuNum());
    	logger.info("===== insuredNo: "+params.getInsuredNo());
    	
    	List<InsuContractsDto> contracts = insuContractsListMapper.findAll(insuContractsDto);
    	
        InsuContractsListDto responseBody = InsuContractsListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .searchTimestamp("20210316")
                .contractCnt(contracts.size())
                .contractList(contracts)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}
