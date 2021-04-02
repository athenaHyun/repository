package com.gsitm.mydata.api.support.consent;

import lombok.*;

import java.sql.Timestamp;

@Data @NoArgsConstructor @AllArgsConstructor
@Setter @Getter @Builder
public class ConsentDetailDto {
    private String consentType;
    private Timestamp consentDate;
    private Timestamp consentExpDate;
}
