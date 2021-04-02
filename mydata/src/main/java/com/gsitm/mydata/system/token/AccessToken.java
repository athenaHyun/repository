package com.gsitm.mydata.system.token;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AccessToken {

    @JsonProperty("organization_code")
    private String organizationCode;
    
    @JsonProperty("client_id")
    private String clientId;
    
    @JsonProperty("client_secret")
    private String clientSecret;
    
    @JsonProperty("access_token")
    private String accessToken;
    
    @JsonProperty("refresh_token")
    private String refreshToken;
    
    @JsonProperty("access_yn")
    private String accessYn;
    
    @JsonProperty("create_time")
    private String createTime;

    @JsonProperty("update_time")
    private String updateTime;
    
    @JsonProperty("redirect_uri")
    private String redirectUri;
    
    @JsonProperty("response_type")
    private String responseType;
    
    @JsonProperty("scope")
    private String scope;
    
    @JsonProperty("grant_type")
    private String grantType;
}
