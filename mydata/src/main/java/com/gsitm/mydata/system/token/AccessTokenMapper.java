package com.gsitm.mydata.system.token;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccessTokenMapper {
	AccessToken findById(AccessToken accessTokenDto);
	
	void insertAccessToken(AccessToken accessTokenDto);
	
	void updateAccessToken(AccessToken accessTokenDto);
}
