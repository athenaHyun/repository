package com.gsitm.mydata.api.support.token;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gsitm.mydata.TestElement;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class TokenRequestControllerTests {
    @Autowired
    MockMvc mockMvc;

    @Autowired
    ObjectMapper objectMapper;

    @Test
    public void getTokenRequestTest() throws Exception {
        //todo get accessToken
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setBearerAuth(TestElement.ACCESS_TOKEN);

        mockMvc.perform(post("/support/oauth/2.0/token")
                .contentType(MediaType.APPLICATION_JSON)
                .headers(httpHeaders))
                .andDo(print())
                .andExpect(status().is2xxSuccessful())
                .andExpect(jsonPath("access_token").exists());
    }
}
