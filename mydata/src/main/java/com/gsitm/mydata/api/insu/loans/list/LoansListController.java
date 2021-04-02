package com.gsitm.mydata.api.insu.loans.list;

import java.util.List;

import javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/loans")
public class LoansListController {

    private final LoansListMapper irpMapper;

    public LoansListController(LoansListMapper irpMapper) {
        this.irpMapper = irpMapper;
    }

    // 대출상품 목록 조회
    @GetMapping
    public ResponseEntity getIrpList( @RequestParam(name = "org_code") String orgCode,
    		                           @RequestParam(name = "search_timestamp") String searchTimestamp ) throws NotFoundException {
    	
        LoansDto irpDto = LoansDto.builder         (                 )
				              .orgCode		   ( orgCode         )
				              .searchTimestamp ( searchTimestamp )
				              .build           (                 );
        
        List<LoansDto> irps = irpMapper.findAll(irpDto);

        if(irps.size() == 0) {
            throw new NotFoundException("");
        }

        LoansListDto responseBody = LoansListDto.builder().rspCode         ( "000000"    )
										              .rspMsg          ( "성공"      )
										              .searchTimestamp ( "0"         )
										              .irpCnt          ( irps.size() )
										              .irpList         ( irps        )
										              .build           (             );
        
        return ResponseEntity.ok().body(responseBody);
    }
    
}
