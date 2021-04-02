package com.gsitm.mydata.api.common.consent;

import org.apache.ibatis.annotations.Mapper;

import java.util.Optional;

@Mapper
public interface ConsentMapper {
    ConsentDto findOne(ConsentDto consentDto);
    Optional<ConsentDto> findOneOptional(ConsentDto consentDto);
}
