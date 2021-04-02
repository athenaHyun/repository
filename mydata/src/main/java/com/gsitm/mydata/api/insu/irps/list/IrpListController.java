package com.gsitm.mydata.api.insu.irps.list;

import java.util.List;

import javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/irps")
public class IrpListController {

    private final IrpListMapper irpMapper;

    public IrpListController(IrpListMapper irpMapper) {
        this.irpMapper = irpMapper;
    }

    // 개인형 IRP 계좌 목록 조회
    @GetMapping
    public ResponseEntity getIrpList( @RequestParam(name = "org_code") String orgCode,
    		                           @RequestParam(name = "search_timestamp") String searchTimestamp ) throws NotFoundException {
    	
        IrpDto irpDto = IrpDto.builder         (                 )
				              .orgCode		   ( orgCode         )
				              .searchTimestamp ( searchTimestamp )
				              .build           (                 );
        
        List<IrpDto> irps = irpMapper.findAll(irpDto);

        if(irps.size() == 0) {
            throw new NotFoundException("");
        }

        IrpListDto responseBody = IrpListDto.builder().rspCode         ( "000000"    )
										              .rspMsg          ( "성공"      )
										              .searchTimestamp ( "0"         )
										              .irpCnt          ( irps.size() )
										              .irpList         ( irps        )
										              .build           (             );
        
        return ResponseEntity.ok().body(responseBody);
    }
    
}
