package com.gsitm.mydata.api.v1.insu.insurances.contracts;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuContractsDto {
	@JsonIgnore private String orgCode;
   private String contractName;
   private String contractStatus;
   private String contractExpDate;
   private String contractFaceAmt;
   private String currencyCode;
   private String isRequired;
}
