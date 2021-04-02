package com.gsitm.mydata.api.insu.irps.list;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class IrpDto {
    
    @JsonIgnore private String orgCode;				// 기관코드
    @JsonIgnore private String searchTimestamp;		// 조회 타임스탬프
    
    private String prodName;						// 상품명
    private String accountNum;						// 계좌번호
    private String seqno;							// 회차번호
    private String isConsent;						// 전송요구 여부
    private String accountStatus;					// 계좌번호별 상태 코드
}
