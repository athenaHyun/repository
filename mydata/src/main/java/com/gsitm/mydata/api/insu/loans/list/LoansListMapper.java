package com.gsitm.mydata.api.insu.loans.list;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LoansListMapper {
    List<LoansDto> findAll(LoansDto irpDto);	// 대출상품 목록 조회
}

