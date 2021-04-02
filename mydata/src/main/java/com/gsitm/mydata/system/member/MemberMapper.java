package com.gsitm.mydata.system.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	Member findById(String client_id);
	
	void updateMember(Member memberDto);
	
	void insertMember(Member memberDto);
}
