package com.gsitm.mydata.api.insu.irps.transactions;

import lombok.*;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class IrpTranListDto {
    private String rspCode;						// 세부 응답코드
    private String rspMsg;						// 세부 응답메시지
    private String searchTimestamp;				// 조회 타임스탬프
    private int nextPage = 0;					// 다음페이지
    private int transCnt;						// 보유계좌수
    private List<IrpTranDto> transList;			// 보유계좌목록
    
}
