package com.gsitm.mydata.api.insu.irps.basic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gsitm.mydata.api.insu.irps.list.IrpListMapper;

@RestController
@RequestMapping(path="/irps/basic")
public class IrpBasicController {

    private final IrpBasicListMapper irpMapper;

    public IrpBasicController(IrpBasicListMapper irpMapper) {
        this.irpMapper = irpMapper;
    }

    // 개인형 IRP 계좌 기본정보 조회
    @PostMapping
    public ResponseEntity getIrpBasicList( @RequestBody Map<?,?> requestBody ) throws NotFoundException {
    	
        IrpBasicDto irpDto = IrpBasicDto.builder         (                                               )
							            .orgCode		 ( (String) requestBody.get("org_code"         ) )
							            .accountNum		 ( (String) requestBody.get("account_num"      ) )
							            .seqno		     ( (String) requestBody.get("seqno"            ) )
							            .searchTimestamp ( (String) requestBody.get("search_timestamp" ) )
							            .build           (                                               );
        
        Map map = irpMapper.findByOne(irpDto);

        String result = (String) map.get("accumAmt");

        if( "".equals(result) ) {
            throw new NotFoundException("");
        }

        IrpBasicListDto responseBody = IrpBasicListDto.builder().rspCode ( "000000"                              )
										              .rspMsg            ( "성공"                                )
										              .searchTimestamp   ( "0"                                   )
										              .accumAmt          ( (String) map.get("accumAmt"         ) )
										              .evalAmt           ( (String) map.get("evalAmt"          ) )
										              .employerAmt       ( (String) map.get("employerAmt"      ) )
										              .employeeAmt       ( (String) map.get("employeeAmt"      ) )
										              .issueDate         ( (String) map.get("issueDate"        ) )
										              .firstDepositDate  ( (String) map.get("firstDepositDate" ) )
										              .build             (                                       );
        
        return ResponseEntity.ok().body(responseBody);
    }
    
}
