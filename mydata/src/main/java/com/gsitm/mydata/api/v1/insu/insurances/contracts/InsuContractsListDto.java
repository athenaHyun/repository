package com.gsitm.mydata.api.v1.insu.insurances.contracts;

import lombok.*;

import java.util.List;

import com.gsitm.mydata.api.v1.insu.insurances.basic.InsuBasicDto;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter

public class InsuContractsListDto {
	private String rspCode;
    private String rspMsg;
    private String searchTimestamp;
    private int contractCnt;
    private List<InsuContractsDto> contractList;
}