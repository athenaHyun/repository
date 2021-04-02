package com.gsitm.mydata.system.exception;

import com.auth0.jwt.exceptions.JWTVerificationException;
import javassist.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MissingRequestHeaderException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.ServletException;
import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class ExceptionAdvisor {

    @ExceptionHandler(ServletException.class)
    public ResponseEntity handleJWTVerificationException(JWTVerificationException e){
        Map responseBody = new HashMap<>();
        responseBody.put("rsp_code", "40101");
        responseBody.put("rsp_msg", "접근토큰 오류 입니다.");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(responseBody);
    }

    @ExceptionHandler(MissingRequestHeaderException.class)
    public ResponseEntity handleMissingRequestHeaderException(){
        Map responseBody = new HashMap<>();
        responseBody.put("rsp_code", "40002");
        responseBody.put("rsp_msg", "헤더 파라메터가 존재하지 않습니다.");
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseBody);
    }

    @ExceptionHandler({MissingServletRequestParameterException.class, ServletRequestBindingException.class})
    public ResponseEntity handleMSRPException() {
        Map responseBody = new HashMap<>();
        responseBody.put("rsp_code", "40001");
        responseBody.put("rsp_msg", "요청 파라메터가 존재하지 않습니다.");
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(responseBody);
    }

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity handleNotFoundException() {
        Map responseBody = new HashMap<>();
        responseBody.put("rsp_code", "40402");
        responseBody.put("rsp_msg", "요청한 자산에 대한 정보가 존재하지 않습니다.");
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(responseBody);
    }
}
