package com.gsitm.mydata.api.insu.irps.detail;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class IrpDetailDto {
    
    private String orgCode;							// 기관코드
    @JsonIgnore private String searchTimestamp;		// 조회 타임스탬프
    @JsonIgnore private int limit = 0;				// 최대 조회갯수
    @JsonIgnore private int nextPage = 0;			// 다음페이지
    private String apiUri;							// 계좌번호
    private String name;							// 회차번호

}




