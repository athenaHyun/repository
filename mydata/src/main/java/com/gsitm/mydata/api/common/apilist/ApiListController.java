package com.gsitm.mydata.api.common.apilist;

import java.util.List;

import javassist.NotFoundException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/v1/insu/apis")
public class ApiListController {

    private final ApiListMapper apiMapper;

    public ApiListController(ApiListMapper apiMapper) {
        this.apiMapper = apiMapper;
    }

    @GetMapping
    public ResponseEntity getApiList(@RequestParam(name = "org_code") String orgCode) throws NotFoundException {
        ApiDto apiDto = ApiDto.builder()
                .orgCode(orgCode)
                .build();
        List<ApiDto> apis = apiMapper.findAll(apiDto);

        if(apis.size() == 0) {
            throw new NotFoundException("");
        }

        ApiListDto responseBody = ApiListDto.builder().rspCode("000000")
                .rspMsg("성공")
                .version(apis.get(0).getVersion())
                .minVersion(apis.get(0).getMinVersion())
                .apiCnt(apis.size())
                .apiList(apis)
                .build();
        return ResponseEntity.ok().body(responseBody);
    }
}
