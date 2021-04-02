package com.gsitm.mydata.api.common.consent;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConsentDto {

    @JsonIgnore
    private int consentId;
    @NotEmpty @JsonIgnore
    private String orgCode;
    @JsonIgnore
    private int serviceId;
    @JsonIgnore
    private int customerId;
    @JsonProperty("rsp_code")
    private String rspCode;
    @JsonProperty("rsp_msg")
    private String rspMsg;
    @JsonProperty("is_scheduled")
    private boolean isScheduled;
    @JsonProperty("cycle")
    private String cycle;
    @JsonProperty("end_date")
    private Timestamp endDate;
    @JsonProperty("purpose")
    private String purpose;
    @JsonProperty("period")
    private String holdingTerm;
}
