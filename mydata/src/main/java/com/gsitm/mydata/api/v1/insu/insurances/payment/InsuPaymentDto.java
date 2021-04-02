package com.gsitm.mydata.api.v1.insu.insurances.payment;

import lombok.*;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class InsuPaymentDto {
	@JsonIgnore private String orgCode;
    private String rspCode;
    private String rspMsg;
    private String searchTimestamp;
    private String payDue;
    private String payCycle;
    private int payCnt;
    private String payOrgCode;
    private String payDate;
    private String payEndDate;
    private String payAmt;
    private String currencyCode;
    private String idAutoPay;
}
