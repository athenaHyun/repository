package com.gsitm.mydata.api.v1.insu.insurances.contracts;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Params {

    @JsonProperty("org_code")
    private String orgCode;
    
    @JsonProperty("search_timestamp")
    private String searchTimestamp;
    
    @JsonProperty("insu_num")
    private String insuNum;
    
    //피보험자 순번
    @JsonProperty("insured_no")
    private String insuredNo;
 
}
