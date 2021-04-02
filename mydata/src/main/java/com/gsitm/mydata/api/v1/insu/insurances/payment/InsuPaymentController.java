package com.gsitm.mydata.api.v1.insu.insurances.payment;

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
@RequestMapping(path="/insurances/payment")
public class InsuPaymentController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuPaymentMapper insuPaymentMapper;

    public InsuPaymentController(InsuPaymentMapper insuPaymentMapper) {
        this.insuPaymentMapper = insuPaymentMapper;
    }

    @PostMapping
    public ResponseEntity getPaymentList(@RequestBody PaymentParams params) throws NotFoundException {
    	
    	InsuPaymentDto insuPaymentDto = InsuPaymentDto.builder()
    			.orgCode(params.getOrgCode())
    			.build();
    	
    	logger.info("===== orgCode: "+params.getOrgCode());
    	logger.info("===== searchTimestamp: "+params.getSearchTimestamp());
    	logger.info("===== insuNum: "+params.getInsuNum());
    	
//    	List<InsuBasicDto> basics = insuBisicListMapper.findAll(insuBasicDto);
    	
        InsuPaymentDto responseBody = InsuPaymentDto.builder().rspCode("000000")
                .rspMsg("성공")
                .searchTimestamp("20210316")
                .payDue("20210331")
                .payCycle("1M")
                .payCnt(10)
                .payOrgCode("payOrgCode")
                .payDate("20210430")
                .payEndDate("20211231")
                .payAmt("300000")
                .currencyCode("KWR")
                .idAutoPay("nness")
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}