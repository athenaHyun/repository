package com.gsitm.mydata.consentStep;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ConsentStepInsuDto {
	@JsonProperty("client_id")
	private String clientId;
	
	@JsonProperty("insu_num")
	private String insuNum;
	
	@JsonProperty("prod_name")
	private String prodName;
	
	@JsonProperty("insured_name")
	private String insuredName;
	
	@JsonProperty("consent_id")
	private String consentId;
	
	@JsonProperty("is_scheduled")
	private Byte isScheduled;	
}
