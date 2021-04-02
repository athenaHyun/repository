package com.gsitm.mydata.api.common.apilist;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApiListMapper {
    ApiDto findById(String id);

    List<ApiDto> findAll(ApiDto apiDto);
}

