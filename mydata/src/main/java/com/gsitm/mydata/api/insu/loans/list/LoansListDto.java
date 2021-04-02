package com.gsitm.mydata.api.insu.loans.list;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class LoansListDto {
    private String rspCode;				// 세부 응답코드
    private String rspMsg;				// 세부 응답메시지
    private String searchTimestamp;		// 조회 타임스탬프
    private int irpCnt;				// 보유계좌수
    private List<LoansDto> irpList;		// 보유계좌목록
}
