package com.gsitm.mydata.api.insu.irps.list;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IrpListMapper {
    List<IrpDto> findAll(IrpDto irpDto);	// 개인형 IRP 계좌 목록 조회
}

