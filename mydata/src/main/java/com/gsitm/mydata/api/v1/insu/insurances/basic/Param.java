package com.gsitm.mydata.api.v1.insu.insurances.basic;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Param {

    @JsonProperty("org_code")
    private String orgCode;
    
    @JsonProperty("search_timestamp")
    private String searchTimestamp;
    
    @JsonProperty("insu_num")
    private String insuNum;
 
}
