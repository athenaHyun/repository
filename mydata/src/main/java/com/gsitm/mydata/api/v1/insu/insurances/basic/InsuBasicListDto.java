package com.gsitm.mydata.api.v1.insu.insurances.basic;

import lombok.*;

import java.util.List;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class InsuBasicListDto {
    private String rspCode;
    private String rspMsg;
    private String searchTimestamp;
    private String isRenewable;
    private String issueDate;
    private String expDate;
    private String faceAmt;
    private String currencyCode;
    private String isVariable;
    private String isUniversal;
    private String pensionRcvStartDate;
    private String pensionRecCycle;
    private String isLoanable;
    private int insuredCount;
    private List<InsuBasicDto> insuredList;
}
