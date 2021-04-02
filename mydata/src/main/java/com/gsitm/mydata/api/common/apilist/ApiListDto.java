package com.gsitm.mydata.api.common.apilist;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ApiListDto {
    private String rspCode;
    private String rspMsg;
    private String version;
    private String minVersion;
    private int apiCnt;
    private List<ApiDto> apiList;
}
