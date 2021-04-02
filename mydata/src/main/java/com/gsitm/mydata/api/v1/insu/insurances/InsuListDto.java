package com.gsitm.mydata.api.v1.insu.insurances;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class InsuListDto {
    private String rspCode;
    private String rspMsg;
    private String searchTimestamp;
    private int insuCnt;
    private List<InsuDto> insuList;
}
