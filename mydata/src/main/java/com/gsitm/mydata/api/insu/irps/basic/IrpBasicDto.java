package com.gsitm.mydata.api.insu.irps.basic;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class IrpBasicDto {
    
    @JsonIgnore private String orgCode;				// 기관코드
    @JsonIgnore private String searchTimestamp;		// 조회 타임스탬프
    @JsonIgnore private String accountNum;			// 계좌번호
    @JsonIgnore private String seqno;				// 회차번호
    
    private String accumAmt;
    private String evalAmt;
    private String employerAmt;
    private String employeeAmt;
    private String issueDate;
    private String firstDepositDate;
}
