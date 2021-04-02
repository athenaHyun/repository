package com.gsitm.mydata.api.v1.insu.insurances.transactions;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TransactionsParams {

    @JsonProperty("org_code")
    private String orgCode;
    
    @JsonProperty("insu_num")
    private String insuNum;
    
    @JsonProperty("from_date")
    private String fromDate;
    
    @JsonProperty("to_date")
    private String toDate;
    
    @JsonProperty("next_page")
    private String nextPage;
    
    @JsonProperty("limit")
    private String limit;
    
}
