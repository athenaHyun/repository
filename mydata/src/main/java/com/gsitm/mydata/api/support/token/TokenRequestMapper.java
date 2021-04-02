package com.gsitm.mydata.api.support.token;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TokenRequestMapper {
    public CredentialDto findOneByOrgCodeForCentralPortal(CredentialDto credentialDto);
}
