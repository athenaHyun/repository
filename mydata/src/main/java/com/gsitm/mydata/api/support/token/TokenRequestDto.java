package com.gsitm.mydata.api.support.token;

import lombok.*;

@Data @NoArgsConstructor @AllArgsConstructor
@Setter @Getter @Builder
public class TokenRequestDto {
    private String grantType;
    private String clientId;
    private String clientSecret;
    private String scope;
}
