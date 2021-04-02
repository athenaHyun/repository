package com.gsitm.mydata.system.config;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Component
public class JwtTokenUtil {
    @Value("${spring.jwt.secret}")
    private String secret;
    
    public String getSecret() {
        return secret;
    }
    
    @Value("${spring.jwt.secret.refresh}")
    private String secretRefresh;
    
    public String getSecretRefresh() {
    	return secretRefresh;
    }
    
    public static final long JWT_TOKEN_VALIDITY = 1 * 60 * 60 * 1000;	//1시간
    
    public String getUsernameFromToken(String token) {
        return getClaimFromToken(token, Claims::getId);
    }

    public <T> T getClaimFromToken(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = getAllClaimsFromToken(token);
        return claimsResolver.apply(claims);
    }

    private Claims getAllClaimsFromToken(String token) {
        return Jwts.parser().setSigningKey(secret).parseClaimsJws(token).getBody();
    }

    private Boolean isTokenExpired(String token) {
        final Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

    public Date getExpirationDateFromToken(String token) {
        return getClaimFromToken(token, Claims::getExpiration);
    }

    public String generateToken(String id) {
        return generateToken(id, new HashMap<>());
    }

    public String generateToken(String id, Map<String, Object> claims) {
        return doGenerateToken(id, claims, secret);
    }

    public String generateToken(String id, String secretKeytype) {
    	String secretKey = secret;
    	if("refresh".equals(secretKeytype)) {
    		secretKey = secretRefresh;
    	}
        return doGenerateToken(id, new HashMap<>(), secretKey);
    }
    
    public String generateToken(String id, Map<String, Object> claims, String secretKeytype) {
    	String secretKey = secret;
    	if("refresh".equals(secretKeytype)) {
    		secretKey = secretRefresh;
    	}
        return doGenerateToken(id, claims, secretKey);
    }
    
    private String doGenerateToken(String id, Map<String, Object> claims, String secretKey) {
        return Jwts.builder()
                .setClaims(claims)
                .setId(id)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + JWT_TOKEN_VALIDITY))
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
    }

    public Boolean validateToken(String token, UserDetails userDetails) {
        final String username = getUsernameFromToken(token);
        return (username.equals(userDetails.getUsername())) && !isTokenExpired(token);
    }
}