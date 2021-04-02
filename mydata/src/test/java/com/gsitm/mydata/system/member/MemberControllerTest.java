package com.gsitm.mydata.system.member;

import com.gsitm.mydata.GeneralTests;
import org.junit.Test;
import org.springframework.http.MediaType;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class MemberControllerTest extends GeneralTests {

    @Test
    public void createMember() throws Exception {
        Member member = Member.builder()
                .clientId("test@gsitm.com")
                .clientSecret("test").build();

        mockMvc.perform(post("/api/member")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(member)))
                .andDo(print())
                .andExpect(status().is2xxSuccessful());
    }

}