package com.gsitm.mydata.api.v1.insu.insurances;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface InsuListMapper {
    InsuDto findById(String id);

    List<InsuDto> findAll(InsuDto insuDto);
}
