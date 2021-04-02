package com.gsitm.mydata.api.v1.insu.insurances.car;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class InsuCarListDto {
    private String rspCode;
    private String rspMsg;
    private String searchTimestamp;
    private int carInsuCnt;
    private List<InsuCarDto> carInsuList;
}
