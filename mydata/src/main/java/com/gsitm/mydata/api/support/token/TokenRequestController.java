package com.gsitm.mydata.api.support.token;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;

@RestController
@RequestMapping(path="/support/oauth/2.0/token", produces="application/json;charset=UTF-8")
public class TokenRequestController {
    private final String CENTRAL_PORTAL_URI = "http://127.0.0.1:3000";
    private final String GRANT_TYPE = "client_credentials";
    private final String SCOPE = "manage";
    private final String RESOURCE_OWNER_ORG_CODE = "A000001";
    private final int CREDENTIAL_TYPE_CODE = 0;

    private TokenRequestMapper credentialMapper;

    public TokenRequestController(TokenRequestMapper credentialMapper) {
        this.credentialMapper = credentialMapper;
    }

    @PostMapping
    public ResponseEntity getTokenFromCentralPortal(){

        CredentialDto credentialDto = CredentialDto.builder()
                .orgCode(RESOURCE_OWNER_ORG_CODE)
                .typeId(CREDENTIAL_TYPE_CODE)
                .build();
        CredentialDto resultCredentialDto = credentialMapper.findOneByOrgCodeForCentralPortal(credentialDto);

        TokenRequestDto tokenRequestDto = TokenRequestDto.builder()
                .grantType(this.GRANT_TYPE)
                .clientId(resultCredentialDto.getClientId())
                .clientSecret(resultCredentialDto.getClientSecret())
                .scope(this.SCOPE)
                .build();

        // todo covert and save the token resource owner's database
//        RestTemplate restTemplate = new RestTemplate();
//        TokenResponseDto tokenResponseDto = restTemplate.postForObject(
//                CENTRAL_PORTAL_URI,
//                tokenRequestDto,
//                TokenResponseDto.class);

        TokenResponseDto tokenResponseDto = TokenResponseDto.builder()
                .tokenType("Bearer")
                .accessToken("<sample-token>")
                .expiresIn(Timestamp.valueOf("2026-02-02 12:00:00"))
                .scope(SCOPE)
                .build();

        if(tokenResponseDto.hasError()){
            return ResponseEntity.status(500).body(tokenResponseDto);
        }
        return ResponseEntity.status(HttpStatus.OK).body("{\"message\"=\"success\"}");
    }
}
