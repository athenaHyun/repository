package com.gsitm.mydata.api.common.consent;

import javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(path="/v1/insu" )
public class ConsentController {

    private final ConsentMapper consentMapper;

    //private final ConsentValidator consentValidator;

    public ConsentController(ConsentMapper consentMapper) {
        this.consentMapper = consentMapper;
    }

    @GetMapping(path="/consents")
    public ResponseEntity getConsent (
            @RequestHeader("Authorization") String authorization,
            @RequestParam(name="org_code")
            String orgCode) throws NotFoundException {
        ConsentDto consentDto = ConsentDto.builder()
                .orgCode(orgCode)
                .serviceId(1)
                .customerId(1)
                .build();

        ConsentDto response;
        response = consentMapper.findOneOptional(consentDto).orElseThrow(()-> new NotFoundException(""));

        response.setRspCode("000000");
        response.setRspMsg("정상적으로 처리되었습니다.");

        return ResponseEntity.ok().body(response);

    }
}

