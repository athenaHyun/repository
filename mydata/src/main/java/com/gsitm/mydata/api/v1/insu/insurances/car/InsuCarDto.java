package com.gsitm.mydata.api.v1.insu.insurances.car;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuCarDto {
	@JsonIgnore private String orgCode;
   private String carNumber;
   private String carInsuType;
   private String carName;
   private String startDate;
   private String endDate;
   private String contractAge;
   private String contractDriver;
   private String isOwnDmgCoverAge;
   private String selfPayRate;
   private String selfPayAmt;
}
