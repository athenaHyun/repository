package com.gsitm.mydata.api.insu.irps.basic;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IrpBasicListMapper {
    Map findByOne(IrpBasicDto irpDto);	// 개인형 IRP 계좌 기본정보 조회
}

