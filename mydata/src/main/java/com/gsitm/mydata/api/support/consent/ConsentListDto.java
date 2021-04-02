package com.gsitm.mydata.api.support.consent;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor
@Setter @Getter @Builder
public class ConsentListDto {
    @JsonIgnore
    private String orgCode;

    @JsonIgnore
    private int serviceId;

    @JsonIgnore
    private int consentId;

    @JsonIgnore
    private int customerId;

    @JsonIgnore
    private String userCi;

    private String rspCode;

    private String rspMsg;

    @JsonProperty(value="is_member")
    private boolean isMember;

    private int serviceCnt;

    private List<ServiceListDto> serviceList;

}
