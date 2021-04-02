package com.gsitm.mydata.api.v1.insu.insurances.car.transactions;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InsuCarTransactionsMapper {
	List<InsuCarTransactionsDto> findAll(InsuCarTransactionsDto insuCarTransactionsDto);
}