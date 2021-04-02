package com.gsitm.mydata.system.member.detail;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberDetailListMapper {
    
	//member_detail 회원삭제
	void delete(String clientId);
    
    //member 회원삭제
    void deleteMember(String clientId);
    
    //member 회원추가
    void addMember(MemberDetailListDto memberDetailListDto);
    
    //member_detail 회원추가
    void addMemberDetail(MemberDetailListDto memberDetailListDto);
    
    //member_detail 회원 조회
    List<MemberDetailListDto> findAll();
    
    //member_detail 중복 체크
    int countId(Map<String, Object> param);
    
    //member 중복 체크
    int countIdMember(Map<String, Object> param);
    
    // 동의회원 가입 정보 유무 확인
    int findHavingClient(Map<String, Object> param);
}
