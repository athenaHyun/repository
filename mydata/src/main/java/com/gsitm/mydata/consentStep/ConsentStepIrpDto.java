package com.gsitm.mydata.consentStep;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.gsitm.mydata.api.v1.insu.insurances.payment.PaymentParams;

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
public class ConsentStepIrpDto {
	
	@JsonProperty("client_id")
	private String clientId;	
	
	@JsonProperty("org_code")
	private String orgCode;
	
	@JsonProperty("account_num")
	private String accountNum;
	
	@JsonProperty("prod_name")
	private String prodName;
	
	@JsonProperty("issue_date")
	private String issueDate;
	
	@JsonProperty("first_deposit_date")
	private String firstDepositDate;
	
	@JsonProperty("is_scheduled")
	private Byte isScheduled;	
}
