package com.gsitm.mydata.api.support.consent;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.hamcrest.Matchers;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.http.MediaType.APPLICATION_JSON;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ConsentListControllerTests {
    @Autowired
    MockMvc mockMvc;

    @Autowired
    ObjectMapper objectMapper;

    @Test
    public void testGetConsentListForCentral() throws Exception {
        ConsentRequestDto consentRequestDto = ConsentRequestDto.builder()
                .orgCode("T012482")
                .userCi("your-connecting-information")
                .build();

        mockMvc.perform(post("/v1/mgmts/consents")
                .contentType(APPLICATION_JSON)
                .header("authorization", "Bearer eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTIxNzM3NTAsImlhdCI6MTYxMjE1NTc1MCwianRpIjoic2FpbkBnc3RpbS5jb20ifQ.z6r8nTgx-S5nlkeg2hI2R3IsMS3CqspPazxNpjtvPfpdpP5xIOopBohvuhHD3W2YLANGWetmjOvspToUswzVdg")
                .content(objectMapper.writeValueAsString(consentRequestDto)))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("rsp_code").value(Matchers.is("00000")))
                .andExpect(jsonPath("rsp_msg").exists())
                .andExpect(jsonPath("is_member").exists())
                .andExpect(jsonPath("service_cnt").exists())
                .andExpect(jsonPath("service_list").exists())
                .andExpect(jsonPath("service_list[0].service_name").exists())
                .andExpect(jsonPath("service_list[0].client_id").exists())
                .andExpect(jsonPath("service_list[0].consent_cnt").exists())
                .andExpect(jsonPath("service_list[0].consent_list").exists())
                .andExpect(jsonPath("service_list[0].consent_list[0].consent_type").exists())
                .andExpect(jsonPath("service_list[0].consent_list[0].consent_date").exists())
                .andExpect(jsonPath("service_list[0].consent_list[0].consent_exp_date").exists());
    }

    @Test
    public void test_404_ConsentListForCentral() throws Exception {
        ConsentRequestDto consentRequestDto = ConsentRequestDto.builder()
                .orgCode("T012481")
                .userCi("your-connecting-information")
                .build();

        mockMvc.perform(post("/v1/mgmts/consents")
                .contentType(APPLICATION_JSON)
                //.header("authorization", "Bearer eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTIxNzM3NTAsImlhdCI6MTYxMjE1NTc1MCwianRpIjoic2FpbkBnc3RpbS5jb20ifQ.z6r8nTgx-S5nlkeg2hI2R3IsMS3CqspPazxNpjtvPfpdpP5xIOopBohvuhHD3W2YLANGWetmjOvspToUswzVdg")
                .content(objectMapper.writeValueAsString(consentRequestDto)))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(jsonPath("rsp_code").value(Matchers.is("40402")))
                .andExpect(jsonPath("is_member").value(false));
    }

    @Test
    public void test_400_ConsentListForCentral() throws Exception {
        ConsentRequestDto consentRequestDto = ConsentRequestDto.builder()
                .orgCode("")
                .userCi("")
                .build();

        mockMvc.perform(post("/v1/mgmts/consents")
                .contentType(APPLICATION_JSON)
                .header("authorization", "Bearer eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE2MTIxNzM3NTAsImlhdCI6MTYxMjE1NTc1MCwianRpIjoic2FpbkBnc3RpbS5jb20ifQ.z6r8nTgx-S5nlkeg2hI2R3IsMS3CqspPazxNpjtvPfpdpP5xIOopBohvuhHD3W2YLANGWetmjOvspToUswzVdg")
                .content(objectMapper.writeValueAsString(consentRequestDto)))
                .andDo(print())
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("rsp_code").value(Matchers.is("40001")));
    }
}
