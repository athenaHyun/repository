package com.gsitm.mydata.consentStep;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ConsentStepLoanMapper {
	List<ConsentStepLoanDto> findById(String clientId);
	void insertConsents(@Param("customerId") String customerId, @Param("accountNum") String accountNum);
	void deleteConsents(String customerId);
	List<ConsentStepLoanDto> findScheduledById(String clientId);
}