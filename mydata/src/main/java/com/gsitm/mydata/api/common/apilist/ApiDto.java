package com.gsitm.mydata.api.common.apilist;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class ApiDto {
    @JsonIgnore private Integer apiId;
    @JsonIgnore private String orgCode;
    private String apiUri;
    @JsonIgnore private String apiTypeCode;
    @JsonIgnore private String typeName;
    @JsonIgnore private String method;
    @JsonIgnore private String minVersion;
    @JsonIgnore private String name;
    @JsonIgnore private String version;
    @JsonIgnore private String id;
}
