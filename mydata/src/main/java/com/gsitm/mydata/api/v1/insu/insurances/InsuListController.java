package com.gsitm.mydata.api.v1.insu.insurances;

import java.util.List;

import javassist.NotFoundException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/insurances")
public class InsuListController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final InsuListMapper insuMapper;

    public InsuListController(InsuListMapper insuMapper) {
        this.insuMapper = insuMapper;
    }

    @GetMapping
    public ResponseEntity getApiList(@RequestParam(name = "org_code") String orgCode, @RequestParam(name = "search_timestamp") String searchTimestamp) throws NotFoundException {
        InsuDto insuDto = InsuDto.builder()
                .orgCode(orgCode)
                .build();
        logger.info("==== orgCode: "+orgCode);
        logger.info("==== searchTimestamp: "+searchTimestamp);
        
        List<InsuDto> insus = insuMapper.findAll(insuDto);

        if(insus.size() == 0) {
            throw new NotFoundException("");
        }

        InsuListDto responseBody = InsuListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .searchTimestamp("20210316")
                .insuCnt(insus.size())
                .insuList(insus)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}
