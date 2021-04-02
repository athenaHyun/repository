package com.gsitm.mydata.assetMng;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface AssetMngMapper {
	List<Map<String, Object>> findAll(Map<String, Object> param);	// 자산관리 조회
	
	// 20210329 dc13 생성
	List<Map<String, Object>> findAllLoan(Map<String, Object> param);	// 대출 자산관리 조회
	List<Map<String, Object>> findAllIrp(Map<String, Object> param);	// 개인형IRP 자산관리 조회
	// 20210329 dc13 생성
	
	int findAssetMngCnt(Map<String, Object> param);					// 자산관리 건수 조회
	
	// 20210329 dc13 생성
	int findAssetMngLoanCnt(Map<String, Object> param);					// 대촐 자산관리 건수 조회
	int findAssetMngIrpCnt(Map<String, Object> param);					// irp 자산관리 건수 조회
	// 20210329 dc13 생성
	
    void assetInsert(Map<String, Object> param);					// 자산관리 입력
    
    // 20210329 dc13 생성
    void assetInsertLoan(Map<String, Object> param);				// 자산관리 입력
    void assetInsertIrp(Map<String, Object> param);					// 자산관리 입력
    // 20210329 dc13 생성
        
    void assetModify(Map<String, Object> param);					// 자산관리 수정
    
    // 20210329 dc13 생성    
    void assetModifyLoan(Map<String, Object> param);				// 자산관리 수정
    void assetModifyIrp(Map<String, Object> param);					// 자산관리 수정
    // 20210329 dc13 생성    
        
    void assetDelete(Map<String, Object> param);					// 자산관리 삭제

    // 20210329 dc13 생성
    void assetDeleteLoan(Map<String, Object> param);				// 자산관리 삭제
    void assetDeleteIrp(Map<String, Object> param);					// 자산관리 삭제
    // 20210329 dc13 생성
    
}

