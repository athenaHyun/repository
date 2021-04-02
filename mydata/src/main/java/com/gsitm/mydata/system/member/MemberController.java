package com.gsitm.mydata.system.member;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MemberController {

    final MemberMapper memberMapper;
    final PasswordEncoder encode;

    @PostMapping("/api/member")
    public Member saveMember(@RequestBody Member memberDto) {
    	memberDto.setClientSecret(encode.encode(memberDto.getClientSecret()));
    	memberMapper.insertMember(memberDto);
        return memberMapper.findById(memberDto.getClientId());
    }

}
