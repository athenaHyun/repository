package com.gsitm.mydata.api.v1.insu.insurances.transactions;

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
@RequestMapping(path="/insurances/transactions")
public class InsuTransactionsController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuTransactionsMapper insuTransactionsMapper;

    public InsuTransactionsController(InsuTransactionsMapper insuTransactionsMapper) {
        this.insuTransactionsMapper = insuTransactionsMapper;
    }

    @PostMapping
    public ResponseEntity getPaymentList(@RequestBody TransactionsParams params) throws NotFoundException {
    	
    	InsuTransactionsDto insuTransactonsDto = InsuTransactionsDto.builder()
    			.orgCode(params.getOrgCode())
    			.build();
    	
    	logger.info("===== orgCode: "+params.getOrgCode());
    	logger.info("===== insuNum: "+params.getInsuNum());
    	logger.info("===== fromDate: "+params.getFromDate());
    	logger.info("===== toDate: "+params.getToDate());
    	logger.info("===== nextPage: "+params.getNextPage());
    	logger.info("===== limit: "+params.getLimit());
    	
    	List<InsuTransactionsDto> transactions = insuTransactionsMapper.findAll(insuTransactonsDto);
    	
        InsuTransactionsListDto responseBody = InsuTransactionsListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .nextPage("기준개체")
                .transCnt(transactions.size())
                .transList(transactions)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}