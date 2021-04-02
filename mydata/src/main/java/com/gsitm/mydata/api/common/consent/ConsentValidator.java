package com.gsitm.mydata.api.common.consent;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Deprecated
@Component
public class ConsentValidator {

    public void verify(String authorization, ConsentDto consentDto)
            throws JWTVerificationException {
        //todo 추후 세션 또는 그외 방법으로 리소스 오너 조직 코드를 올바르게 가져오도록 수정한다.
        String resourceOwnerCode = "A000000001";
        Algorithm algorithm = Algorithm.HMAC256("my-256-bit-secret");
        String token = "";
        String deliminator = " ";

        if(authorization != null &&
                StringUtils.isNotBlank(authorization) &&
                authorization.split(deliminator).length == 2){
            // ****************** 이슈사항 ***************************
            // *  issue : 현재의 규격으로는 서비스 기관의 서비스 식별자
            // *          얻을수가 없다.
            // *  resolve - jti 내 "서비스_식별자 고객_식별자"를 넣
            // *            어 토큰 발급을 한다.
            // *  예시 - jti="1523 12"
            // ******************************************************
            token = authorization.split(deliminator)[1];

            JWTVerifier verifier = JWT.require(algorithm)
                    .withIssuer(resourceOwnerCode)
                    .withAudience(consentDto.getOrgCode())
                    .build();

            DecodedJWT jwt = verifier.verify(token);
            consentDto.setServiceId(Integer.parseInt(jwt.getId().split(" ")[0]));
            consentDto.setCustomerId(Integer.parseInt(jwt.getId().split(" ")[1]));
        } else {
           throw new JWTVerificationException("error - invalid token");
        }
    }
}
