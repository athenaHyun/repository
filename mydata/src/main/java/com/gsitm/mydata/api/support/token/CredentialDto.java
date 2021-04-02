package com.gsitm.mydata.api.support.token;

import lombok.*;

import java.sql.Timestamp;

@Data @NoArgsConstructor @AllArgsConstructor
@Setter @Getter @Builder
public class CredentialDto {
    private int credentialId;
    private String orgCode;
    private String name;
    private int typeId;
    private String clientId;
    private String clientSecret;
    private Timestamp createdAt;
    private Timestamp updatedAt;
}
