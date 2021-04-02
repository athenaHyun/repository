package com.gsitm.mydata.system.member;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    @JsonProperty("client_id")
    private String clientId;
    
    @JsonProperty("client_secret")
    private String clientSecret;
    
    @JsonProperty("organization_code")
    private String organizationCode;
    
    @JsonProperty("authorize_code")
    private String authorizeCode;
    
    @JsonProperty("timestamp")
    private String timestamp;
    
    @JsonProperty("redirect_uri")
    private String redirectUri;
    
    @JsonProperty("response_type")
    private String responseType;
    
    @JsonProperty("scope")
    private String scope;
}
