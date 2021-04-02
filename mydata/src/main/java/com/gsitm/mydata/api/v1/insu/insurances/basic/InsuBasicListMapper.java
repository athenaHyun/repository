package com.gsitm.mydata.api.v1.insu.insurances.basic;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InsuBasicListMapper {
	List<InsuBasicDto> findAll(InsuBasicDto insuBasicDto);
}