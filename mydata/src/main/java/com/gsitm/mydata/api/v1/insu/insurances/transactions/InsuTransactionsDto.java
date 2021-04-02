package com.gsitm.mydata.api.v1.insu.insurances.transactions;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuTransactionsDto {
	@JsonIgnore private String orgCode;
   private String transDate;
   private String transAppliedMonth;
   private String transNo;
   private String paidAmt;
   private String currencyCode;
   private String payMethod;
}
