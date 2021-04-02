package com.gsitm.mydata.api.v1.insu.insurances.car.transactions;

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
@RequestMapping(path="/insurances/car/transactions")
public class InsuCarTransactionsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuCarTransactionsMapper insuCarTransactionsMapper;

    public InsuCarTransactionsController(InsuCarTransactionsMapper insuCarTransactionsMapper) {
        this.insuCarTransactionsMapper = insuCarTransactionsMapper;
    }

    @PostMapping
    public ResponseEntity getCarList(@RequestBody CarTransactionsParams params) throws NotFoundException {
    	
    	InsuCarTransactionsDto insuCarTransactionsDto = InsuCarTransactionsDto.builder()
    			.orgCode(params.getOrgCode())
    			.build();
    	
    	logger.info("===== orgCode: "+params.getOrgCode());
    	logger.info("===== insuNum: "+params.getInsuNum());
    	logger.info("===== carNumber: "+params.getCarNumber());
    	logger.info("===== fromDate: "+params.getFromDate());
    	logger.info("===== toDate: "+params.getToDate());
    	logger.info("===== nextPage: "+params.getNextPage());
    	logger.info("===== limit: "+params.getLimit());
    	
    	List<InsuCarTransactionsDto> carTransactions = insuCarTransactionsMapper.findAll(insuCarTransactionsDto);
    	
        InsuCarTransactionsListDto responseBody = InsuCarTransactionsListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .nextPage("기준개체")
                .transCnt(carTransactions.size())
                .transList(carTransactions)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}