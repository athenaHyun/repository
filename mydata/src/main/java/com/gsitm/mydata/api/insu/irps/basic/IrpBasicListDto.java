package com.gsitm.mydata.api.insu.irps.basic;

import lombok.*;

import java.util.List;
import java.util.Map;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class IrpBasicListDto {
    private String rspCode;				// 세부 응답코드
    private String rspMsg;				// 세부 응답메시지
    private String searchTimestamp;		// 조회 타임스탬프
    private String accumAmt;
    private String evalAmt;
    private String employerAmt;
    private String employeeAmt;
    private String issueDate;
    private String firstDepositDate;
}
