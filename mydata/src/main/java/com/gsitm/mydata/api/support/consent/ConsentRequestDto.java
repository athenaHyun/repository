package com.gsitm.mydata.api.support.consent;

import lombok.*;

import javax.validation.constraints.NotEmpty;

@Data @AllArgsConstructor @NoArgsConstructor
@Setter @Getter @Builder
public class ConsentRequestDto {
    @NotEmpty
    private String orgCode;
    @NotEmpty
    private String userCi;
}
