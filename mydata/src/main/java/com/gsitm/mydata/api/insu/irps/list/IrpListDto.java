package com.gsitm.mydata.api.insu.irps.list;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class IrpListDto {
    private String rspCode;				// 세부 응답코드
    private String rspMsg;				// 세부 응답메시지
    private String searchTimestamp;		// 조회 타임스탬프
    private int irpCnt;				// 보유계좌수
    private List<IrpDto> irpList;		// 보유계좌목록
}
