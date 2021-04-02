package com.gsitm.mydata.api.support.consent;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ConsentDetailMapper {
    List<ServiceListDto> findServiceList(ConsentListDto consentListDto);
    List<ConsentDetailDto> findConsentDetailList(ConsentListDto consentListDto);
}
