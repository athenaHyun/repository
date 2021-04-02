package com.gsitm.mydata.api.insu.irps.transactions;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class IrpTranDto {
    
	@JsonIgnore private String orgCode;				// 기관코드
    @JsonIgnore private String searchTimestamp;		// 조회 타임스탬프
    @JsonIgnore private int limit = 0;				// 최대 조회갯수
    @JsonIgnore private int nextPage = 0;			// 다음페이지
    @JsonIgnore private String fromDate;			// 
    @JsonIgnore private String toDate;				// 
    
    private String id;								// 
    private String issueDate;						// 
    private String expDate;							//
    
}




