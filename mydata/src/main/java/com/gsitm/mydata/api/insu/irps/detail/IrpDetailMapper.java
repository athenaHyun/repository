package com.gsitm.mydata.api.insu.irps.detail;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IrpDetailMapper {
    List<IrpDetailDto> findAll(IrpDetailDto irpDto);	// 개인형 IRP 계좌 추가정보 조회
}

