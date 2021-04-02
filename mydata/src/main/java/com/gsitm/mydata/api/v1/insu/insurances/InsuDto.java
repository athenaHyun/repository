package com.gsitm.mydata.api.v1.insu.insurances;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuDto {
    private Integer insuNum;
    private String isConsent;
    private String prodName;
    private String insuType;
    private String insuStatus;
    @JsonIgnore private String orgCode;
}
