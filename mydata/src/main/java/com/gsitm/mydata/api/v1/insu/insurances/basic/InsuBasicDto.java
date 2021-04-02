package com.gsitm.mydata.api.v1.insu.insurances.basic;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuBasicDto {
	@JsonIgnore private String orgCode;
   private String insuredNo;
   private String insuredName;
}
