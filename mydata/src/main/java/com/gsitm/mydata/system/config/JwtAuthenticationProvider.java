package com.gsitm.mydata.system.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

import com.gsitm.mydata.system.member.Member;
import com.gsitm.mydata.system.member.MemberMapper;

@Component
public class JwtAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String clientId = authentication.getName();
        String clientSecret = authentication.getCredentials().toString();

        Member member = memberMapper.findById(clientId);

        if(!member.getClientSecret().equals(clientSecret)) {
            throw new RuntimeException("UnAuthorized");
        }

        return new UsernamePasswordAuthenticationToken(clientId, clientSecret);
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}