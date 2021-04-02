package com.gsitm.mydata.api.insu.irps.detail;

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

@RestController
@RequestMapping(path="/irps/detail")
public class IrpDetailController {

    private final IrpDetailMapper irpMapper;

    public IrpDetailController(IrpDetailMapper irpMapper) {
        this.irpMapper = irpMapper;
    }

    // 개인형 IRP 계좌 추가정보 조회
    @PostMapping
    public ResponseEntity getIrpList( @RequestBody Map<?,?> requestBody ) throws NotFoundException {
    	
    	String no = (String) requestBody.get("next_page");	// 다음페이지
    	
    	int nextPage = 0;
    	
    	// 다음페이지 값이 있을 경우 셋팅
    	if( !"".equals(no) ) {
    		nextPage = Integer.parseInt( (String) requestBody.get("next_page" ) );
    	} 
    	
        IrpDetailDto irpDto = IrpDetailDto.builder (                                                            )
				              .limit               ( Integer.parseInt( (String) requestBody.get("limit"     ) ) )
				              .nextPage            ( nextPage                                                   )
				              .build               (                                                            );
        
        List<IrpDetailDto> irps = irpMapper.findAll(irpDto);

        // 다음페이지 값의 +1을 더해줌.
        int page = nextPage + 1;
        
        // API 규격 : 다음 페이지가 존재하지 않을경우 다음페이지 값을 셋팅하지 않음.
        irpDto.setNextPage(page);
        List<IrpDetailDto> irps2 = irpMapper.findAll(irpDto);
        
        // 조회시 데이터가 없을 경우 다음페이지 값을 0으로 셋팅        
        if( irps2.size() == 0 ) {
        	page = 0;
        }

        IrpDetailListDto responseBody = IrpDetailListDto.builder().rspCode         ( "000000"    )
													              .rspMsg          ( "성공"      )
													              .searchTimestamp ( "0"         )
													              .irpCnt          ( irps.size() )
													              .nextPage        ( page        )
													              .irpList         ( irps        )
													              .build           (             );
					        
        return ResponseEntity.ok().body(responseBody);
    }
    
}
