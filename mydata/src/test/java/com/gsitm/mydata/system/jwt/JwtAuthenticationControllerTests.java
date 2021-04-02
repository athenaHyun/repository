package com.gsitm.mydata.system.jwt;

import com.gsitm.mydata.GeneralTests;
import com.gsitm.mydata.TestElement;
import com.gsitm.mydata.system.member.Member;
import com.gsitm.mydata.system.token.AccessToken;
import org.hamcrest.Matchers;
import org.junit.Test;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class JwtAuthenticationControllerTests extends GeneralTests {

    @Test
    public void retrieveAuthorizationCode() throws Exception {
        Member member = Member.builder()
                .clientId(TestElement.CLIENT_ID)
                .clientSecret(TestElement.CLIENT_PASSWORD)
                .build();

        mockMvc.perform(post("/oauth/2.0/authorize")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(member)))
                .andDo(print())
                .andExpect(status().is2xxSuccessful())
                .andExpect(jsonPath("rsp_code").exists())
                .andExpect(jsonPath("rsp_msg").exists())
                .andExpect(jsonPath("code").exists());
    }

    @Test
    public void retrieveAccesToken_with_authorization_code() throws Exception{
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setBasicAuth("dGVzdEBnc2l0bS5jb206bWlyYWVhc3NldE15ZGF0YVNlY3JldEtleQ==");
        AccessToken accessToken = AccessToken.builder()
                .grantType("authorization_code")
                .clientId(TestElement.CLIENT_ID)
                .clientSecret(TestElement.CLIENT_PASSWORD)
                .build();

        mockMvc.perform(post("/oauth/2.0/token")
                .contentType(MediaType.APPLICATION_JSON)
                .headers(httpHeaders)
                .content(objectMapper.writeValueAsString(accessToken)))
                .andDo(print())
                .andExpect(status().isCreated())
                .andExpect(jsonPath("access_token").exists())
                .andExpect(jsonPath("token_type").value(Matchers.is("Bearer")));
    }
}
