package com.gsitm.mydata.api.support.consent;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.List;

@Data @NoArgsConstructor @AllArgsConstructor
@Setter @Getter @Builder
public class ServiceListDto {
    @JsonIgnore
    private int serviceId;
    private String serviceName;
    private String clientId;
    private int consentCnt;
    @JsonProperty(value="consent_list")
    private List<ConsentDetailDto> consentDetailDtoList;
}
