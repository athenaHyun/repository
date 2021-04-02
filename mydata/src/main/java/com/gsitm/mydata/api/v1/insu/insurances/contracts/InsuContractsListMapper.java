package com.gsitm.mydata.api.v1.insu.insurances.contracts;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InsuContractsListMapper {
	List<InsuContractsDto> findAll(InsuContractsDto insuContractsDto);
}