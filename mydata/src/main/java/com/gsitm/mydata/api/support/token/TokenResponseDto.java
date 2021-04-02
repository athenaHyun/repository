package com.gsitm.mydata.api.support.token;

import lombok.*;

import java.sql.Timestamp;

@Data @AllArgsConstructor @NoArgsConstructor
@Setter @Getter @Builder
public class TokenResponseDto {
    private String tokenType;
    private String accessToken;
    private Timestamp expiresIn;
    private String scope;
    private String error;
    private String errorDescription;

    public boolean hasError(){
        if(this.error == null
                || this.error == "") {
            return false;
        }
        return true;
    }
}
