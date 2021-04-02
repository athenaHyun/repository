package com.gsitm.mydata.system.jwt;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gsitm.mydata.system.config.JwtTokenUtil;
import com.gsitm.mydata.system.member.Member;
import com.gsitm.mydata.system.member.MemberMapper;
import com.gsitm.mydata.system.token.AccessToken;
import com.gsitm.mydata.system.token.AccessTokenMapper;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RestController
@CrossOrigin
@RequiredArgsConstructor
@RequestMapping(path="/oauth/2.0")
public class JwtAuthenticationController {

	final PasswordEncoder encode;
	
    @Value("${spring.jwt.secret}")
    private String secret;
    
    public String getSecret() {
        return secret;
    }
    
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private JwtUserDetailsService userDetailService;

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private AccessTokenMapper accessTokenMapper;
    
    @PostMapping("/authorize")
    public ResponseEntity<Map<?,?>> createAuthenticationCode(HttpServletResponse httpServletResponse, @RequestBody Member authenticationRequest) throws Exception {
    	Map<String, Object> response = new HashMap<>();
    	try {
	    	final Member member = userDetailService.authenticateByCientIdAndSecret
	                (authenticationRequest.getClientId(), authenticationRequest.getClientSecret());
	        String credentials = authenticationRequest.getClientId()+":"+secret;
	        
	        String encodedCredentials = new String(Base64.encode(credentials.getBytes()));
	        String code = "Basic " + encodedCredentials;
	        
	        //authorize_code update
	        member.setAuthorizeCode(code);
	        memberMapper.updateMember(member);
	        
	        response = new HashMap<>();
	        response.put("rsp_code", HttpStatus.OK.series());
	        response.put("rsp_msg", HttpStatus.OK.value());
	        response.put("code", code);
	        response.put("redirect_uri", authenticationRequest.getRedirectUri());
	        
        }catch(Exception e){
	        response.put("rsp_msg", e.toString());
        }
    	return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @PostMapping("/token")
    public ResponseEntity<?> createAuthenticationToken(HttpServletRequest request, @RequestBody AccessToken authenticationRequest) throws Exception {
        Map<String, Object> response = new HashMap<>();
    	try {
    		final String requestTokenHeader = request.getHeader("Authorization"); 
    		final String grantType = authenticationRequest.getGrantType(); 
    		if("refresh_token".equals(grantType)) {
    			String refresh_token = authenticationRequest.getRefreshToken(); 
    			AccessToken accessTokenDto = new AccessToken();
                accessTokenDto.setRefreshToken(refresh_token);
    			AccessToken refreshVO = accessTokenMapper.findById(accessTokenDto);
    			if(refreshVO == null || "N".equals(refreshVO.getAccessYn())) {
    	        	throw new BadCredentialsException("Expired AccessToken");
    	        }
    			final Member member = userDetailService.authenticateByCientIdAndAuthorizeCode
                        (refreshVO.getClientId(), requestTokenHeader);
                final String access_token = jwtTokenUtil.generateToken(refreshVO.getClientId());
                refresh_token = jwtTokenUtil.generateToken(refreshVO.getClientId(), "refresh");
                response.put("access_token", access_token);
                response.put("refresh_token", refresh_token);
                response.put("token_type", "Bearer");
                
                AccessToken accessToken = new AccessToken();
                accessToken.setClientId(refreshVO.getClientId());
                accessToken.setClientSecret(encode.encode(refreshVO.getClientSecret()));
                accessToken.setAccessToken(access_token);
                accessToken.setRefreshToken(refresh_token);
                accessToken.setAccessYn("Y");
                accessTokenMapper.insertAccessToken(accessToken);
    			
    		}else {
    			final Member member = userDetailService.authenticateByCientIdAndAuthorizeCode
                        (authenticationRequest.getClientId(), requestTokenHeader);
                final String access_token = jwtTokenUtil.generateToken(authenticationRequest.getClientId());
                final String refresh_token = jwtTokenUtil.generateToken(authenticationRequest.getClientId(), "refresh");
                response.put("access_token", access_token);
                response.put("refresh_token", refresh_token);
                response.put("token_type", "Bearer");
                
                AccessToken accessToken = new AccessToken();
                accessToken.setClientId(authenticationRequest.getClientId());
                accessToken.setClientSecret(encode.encode(authenticationRequest.getClientSecret()));
                accessToken.setAccessToken(access_token);
                accessToken.setRefreshToken(refresh_token);
                accessToken.setAccessYn("Y");
                accessTokenMapper.insertAccessToken(accessToken);
    		}
        }catch(Exception e){
        	response = new HashMap<>();
	        response.put("rsp_msg", e.toString());
	        return ResponseEntity.badRequest().body(response);
        }
    	return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
    
    @PostMapping("/revoke")
    public ResponseEntity<?> authenticationTokenRevoke(HttpServletRequest request, @RequestBody Member authenticationRequest) throws Exception {
        Map<String, Object> response = new HashMap<>();
    	try {
            
            AccessToken accessToken = new AccessToken();
            accessToken.setClientId(authenticationRequest.getClientId());
            accessToken.setAccessYn("N");
            accessTokenMapper.updateAccessToken(accessToken);
            
            response.put("rsp_code", HttpStatus.OK);
	        response.put("rsp_msg", "Expired AccessToken");
	        
        }catch(Exception e){
        	response = new HashMap<>();
        	response.put("rsp_code", HttpStatus.FAILED_DEPENDENCY);
	        response.put("rsp_msg", e.toString());
        }
    	return new ResponseEntity<>(response, HttpStatus.OK);
    }
}

