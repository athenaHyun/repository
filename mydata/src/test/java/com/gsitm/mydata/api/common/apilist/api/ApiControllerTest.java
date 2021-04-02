package com.gsitm.mydata.api.common.apilist.api;

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
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ApiControllerTest {
    @Autowired
    MockMvc mockMvc;

    /**
     * API 목록 응답 200 테스트
     */
    @Test
    public void test_get_200() throws Exception {
        String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9." +
                "eyJpc3MiOiJBMDAwMDAwMDAxIiwiYXVkIjoiVDAwMDAxMjQ" +
                "4MiIsImp0aSI6IjEgMSIsImV4cCI6MTYxMjA3MDYzMiwic2N" +
                "vcGUiOiJpbnN1Lmxpc3QgaW5zdS5pbnN1cmFuY2UgaW5zdS5sb" +
                "2FuIGluc3UuaXJwIn0.f610Zi8L-8TFOAFuUu5E0vf-BeLg-4xJzdFAaYzbIRE";
        String delim = " ";
        String authPrefix = "bearer";
        String queryParamName = "org_code";
        String orgCode = "A000001";

        mockMvc.perform(get("/v1/insu/apis")
            .contentType(MediaType.APPLICATION_JSON)
            .header(HttpHeaders.AUTHORIZATION, authPrefix+delim+token)
            .queryParam(queryParamName, orgCode))
            .andDo(print())
            .andExpect(status().isOk());
    }
}
