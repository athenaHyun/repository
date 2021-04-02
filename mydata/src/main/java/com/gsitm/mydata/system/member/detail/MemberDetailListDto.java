package com.gsitm.mydata.system.member.detail;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class MemberDetailListDto {
    private String clientId;
    private String birth;
    private String name;
    private String hp;
}
