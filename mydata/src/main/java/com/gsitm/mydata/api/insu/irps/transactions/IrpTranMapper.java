package com.gsitm.mydata.api.insu.irps.transactions;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IrpTranMapper {
    List<IrpTranDto> findAll(IrpTranDto irpDto);	// 개인형 IRP 계좌 거래내역 조회
}

