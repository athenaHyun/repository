package com.gsitm.mydata.api.insu.basic;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InsuBasicMapper {
	List findById(String id);
}

