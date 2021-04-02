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
public class ConsentStepLoanDto {
	@JsonProperty("client_id")
	private String clientId;
	
	@JsonProperty("org_code")
	private String orgCode;
	
	@JsonProperty("account_num")
	private String accountNum;
	
	@JsonProperty("prod_name")
	private String prodName;
	
	@JsonProperty("account_type")
	private String accountType;
	
	@JsonProperty("loan_start_date")
	private String loanStartDate;
	
	@JsonProperty("loan_exp_date")
	private String loanExpDate;
	
	@JsonProperty("is_scheduled")
	private Byte isScheduled;
}
