package com.gsitm.mydata.api.support.consent;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping(path="/v1/mgmts/consents", produces="application/json;charset=UTF-8")
public class ConsentListController {

    private final ConsentDetailMapper consentDetailMapper;

    public ConsentListController(ConsentDetailMapper consentDetailMapper) {
        this.consentDetailMapper = consentDetailMapper;
    }

    @PostMapping
    public ResponseEntity getConsentListForCentral(
            @RequestBody @Valid ConsentRequestDto consentRequestDto, Errors errors) throws ServletRequestBindingException {

        if(errors.hasErrors()) {
            throw new ServletRequestBindingException("");
        }

        //todo 입력된 userCi 값에서 데이터보유자의 정보를 추출해야함.
        // 하지만 아직 고객 쪽 테이블의 구현이 되지 않았음.
        // 테스트 목적으로 고객아이디 1을 하드코딩하여 테스트 한다.
        ConsentListDto consentListDto = ConsentListDto.builder()
                .orgCode(consentRequestDto.getOrgCode())
                .userCi(consentRequestDto.getUserCi())
                .build();
        consentListDto.setCustomerId(1);

        List<ServiceListDto> serviceListDtoList = consentDetailMapper.findServiceList(consentListDto);

        if(serviceListDtoList.size() != 0 ){
            consentListDto.setServiceCnt(serviceListDtoList.size());
            consentListDto.setMember(true);

            serviceListDtoList.stream().forEach(el -> {
                consentListDto.setServiceId(el.getServiceId());
                List<ConsentDetailDto> resultDto = consentDetailMapper.findConsentDetailList(consentListDto);
                el.setConsentDetailDtoList(resultDto);
                el.setConsentCnt(resultDto.size());
            });

            consentListDto.setServiceList(serviceListDtoList);

        } else {
            return ResponseEntity.ok(ConsentListDto
                    .builder()
                    .rspCode("40402")
                    .rspMsg("요청한 자산에 대한 정보는 존재하지 않음")
                    .build());
        }

        consentListDto.setRspCode("00000");
        consentListDto.setRspMsg("처리 성공");
        return ResponseEntity.ok().body(consentListDto);
    }
}
