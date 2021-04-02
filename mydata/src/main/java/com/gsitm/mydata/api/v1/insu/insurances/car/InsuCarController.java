package com.gsitm.mydata.api.v1.insu.insurances.car;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gsitm.mydata.api.v1.insu.insurances.InsuDto;

import javassist.NotFoundException;

@RestController
@RequestMapping(path="/insurances/car")
public class InsuCarController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuCarMapper insuCarMapper;

    public InsuCarController(InsuCarMapper insuCarMapper) {
        this.insuCarMapper = insuCarMapper;
    }

    @PostMapping
    public ResponseEntity getCarList(@RequestBody CarParams params) throws NotFoundException {
    	
    	InsuCarDto insuCarDto = InsuCarDto.builder()
    			.orgCode(params.getOrgCode())
    			.build();
    	
    	logger.info("===== orgCode: "+params.getOrgCode());
    	logger.info("===== searchTimestamp: "+params.getSearchTimestamp());
    	logger.info("===== insuNum: "+params.getInsuNum());
    	
    	List<InsuCarDto> cars = insuCarMapper.findAll(insuCarDto);
    	
        InsuCarListDto responseBody = InsuCarListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .searchTimestamp("20210316")
                .carInsuCnt(cars.size())
                .carInsuList(cars)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}