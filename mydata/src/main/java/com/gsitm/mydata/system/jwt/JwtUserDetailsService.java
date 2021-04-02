package com.gsitm.mydata.system.jwt;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.gsitm.mydata.system.member.Member;
import com.gsitm.mydata.system.member.MemberMapper;
import com.gsitm.mydata.system.member.Role;


@Service
public class JwtUserDetailsService implements UserDetailsService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String client_id) throws UsernameNotFoundException {
        Member member = memberMapper.findById(client_id);
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(Role.USER.getValue()));
        if (client_id.equals("sup2is@gmail.com")) {
            grantedAuthorities.add(new SimpleGrantedAuthority(Role.ADMIN.getValue()));
        }

        return new User(member.getClientId(), member.getClientSecret(), grantedAuthorities);
    }

    public Member authenticateByCientIdAndSecret(String client_id, String client_secret) {
        Member member = memberMapper.findById(client_id);
        if(member == null) {
        	throw new BadCredentialsException("Not MiraeAsset Member");
        }
        
        if(!passwordEncoder.matches(client_secret, member.getClientSecret())) {
            throw new BadCredentialsException("Password not matched");
        }

        return member;
    }
    
    public Member authenticateByCientIdAndAuthorizeCode(String client_id, String authorize_code) {
        Member member = memberMapper.findById(client_id);
        if(member == null) {
        	throw new BadCredentialsException("Not MiraeAsset Member");
        }
        
        if(!authorize_code.matches(member.getAuthorizeCode())) {
        	throw new BadCredentialsException("Authorize Code not matched");
        }

        return member;
    }

}