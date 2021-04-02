package com.gsitm.mydata.consentStep;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ConsentStepInsuMapper {
	List<ConsentStepInsuDto> findById(String clientId);
	void insertConsents(@Param("customerId") String customerId, @Param("insuNum") String insuNum);
	void deleteConsents(String customerId);
	List<ConsentStepInsuDto> findScheduledById(String clientId);
}