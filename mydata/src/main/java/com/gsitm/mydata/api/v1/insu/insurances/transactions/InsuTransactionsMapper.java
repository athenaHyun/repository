package com.gsitm.mydata.api.v1.insu.insurances.transactions;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InsuTransactionsMapper {
	List<InsuTransactionsDto> findAll(InsuTransactionsDto insuTransactionsDto);
}