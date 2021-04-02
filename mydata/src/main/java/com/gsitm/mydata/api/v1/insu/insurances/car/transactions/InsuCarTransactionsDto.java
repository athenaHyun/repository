package com.gsitm.mydata.api.v1.insu.insurances.car.transactions;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuCarTransactionsDto {
	@JsonIgnore private String orgCode;
   private String faceAmt;
   private String transNo;
   private String paidAmt;
   private String payMethod;
}
