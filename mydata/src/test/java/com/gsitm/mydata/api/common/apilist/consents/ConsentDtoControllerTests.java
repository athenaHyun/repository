package com.gsitm.mydata.api.common.apilist.consents;

import org.hamcrest.Matchers;
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
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ConsentDtoControllerTests {

    @Autowired
    MockMvc mockMvc;

    /**
     * 인증코드와 함께 전송요구내역 신청 시 테스트 케이스
     * @throws Exception
     */
    @Test
    public void test_get_200() throws Exception {

        String token = "eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTE5MjQyNzksImlhdCI6MTYxMTkwNjI3OSwianRpIjoic2FpbnRAZ3N0aW0uY29tIn0.1YJoUrM1PQ9hUNsnG92ISG63MvOHORC3HKBvkB02auc3fi9RJTeKpcYSsl3Par27LpzTUin3EqmdvS1zl_uO1Q";
        String delim = " ";
        String authPrefix = "Bearer";
        String queryParamName = "org_code";
        String orgCode = "T000012482";

        mockMvc.perform(get("/v1/insu/consents")
                .contentType(MediaType.APPLICATION_JSON)
                .header(HttpHeaders.AUTHORIZATION, authPrefix+delim+token)
                .queryParam(queryParamName, orgCode))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("rsp_code").exists())
                .andExpect(jsonPath("rsp_msg").exists())
                .andExpect(jsonPath("is_scheduled").exists())
                .andExpect(jsonPath("cycle").exists())
                .andExpect(jsonPath("end_date").exists())
                .andExpect(jsonPath("purpose").exists())
                .andExpect(jsonPath("period").exists());
    }
    /**
     * 인증코드와 함께 전송요구내역 신청 시 테스트 케이스
     * @throws Exception
     */
    @Test
    public void test_get_404() throws Exception {

        String token = "eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTE5MjQyNzksImlhdCI6MTYxMTkwNjI3OSwianRpIjoic2FpbnRAZ3N0aW0uY29tIn0.1YJoUrM1PQ9hUNsnG92ISG63MvOHORC3HKBvkB02auc3fi9RJTeKpcYSsl3Par27LpzTUin3EqmdvS1zl_uO1Q";
        String delim = " ";
        String authPrefix = "Bearer";
        String queryParamName = "org_code";
        String orgCode = "T000012482";

        mockMvc.perform(get("/v1/insu/consents")
                .contentType(MediaType.APPLICATION_JSON)
                .header(HttpHeaders.AUTHORIZATION, authPrefix+delim+token)
                .queryParam(queryParamName, orgCode))
                .andDo(print())
                .andExpect(status().isNotFound());
    }

    /**
     * 인증코드와 함께 전송요구내역 신청 시 테스트 케이스
     * @throws Exception
     */
    @Test
    public void test_get_bad_request_for_org_code() throws Exception {
        String token = "eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTE5MjQyNzksImlhdCI6MTYxMTkwNjI3OSwianRpIjoic2FpbnRAZ3N0aW0uY29tIn0.1YJoUrM1PQ9hUNsnG92ISG63MvOHORC3HKBvkB02auc3fi9RJTeKpcYSsl3Par27LpzTUin3EqmdvS1zl_uO1Q";
        String delim = " ";
        String authPrefix = "Bearer";
        String queryParamName = "org_code";
        String orgCode = "T000012481";

        mockMvc.perform(get("/v1/insu/consents")
                .contentType(MediaType.APPLICATION_JSON)
                .header(HttpHeaders.AUTHORIZATION, authPrefix+delim+token))
                .andDo(print())
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("rsp_code").value(Matchers.is("40001")));
    }

    /**
     * 인증코드와 함께 전송요구내역 신청 시 테스트 케이스
     * @throws Exception
     */
    @Test
    public void test_get_with_not_valid_token() throws Exception {
        String token = "eyJ.f610Zi8L-8TFOAFuUu5E0vf-BeLg-4xJzdFAaYzbIRE";
        String delim = " ";
        String authPrefix = "Bearer";
        String queryParamName = "org_code";
        String orgCode = "T000012482";

        mockMvc.perform(get("/v1/insu/consents")
                .contentType(MediaType.APPLICATION_JSON)
                .header(HttpHeaders.AUTHORIZATION, authPrefix+delim+token)
                .queryParam(queryParamName, orgCode))
                .andDo(print())
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("rsp_code").value(Matchers.is("40101")));
    }
}
