package com.gsitm.mydata.api.v1.insu.insurances.car;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InsuCarMapper {
	List<InsuCarDto> findAll(InsuCarDto insuCarDto);
}