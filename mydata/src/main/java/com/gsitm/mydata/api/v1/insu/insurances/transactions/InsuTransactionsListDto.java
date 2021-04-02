package com.gsitm.mydata.api.v1.insu.insurances.transactions;

import java.util.List;

import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuTransactionsListDto {
   private String rspCode;
   private String rspMsg;
   private String nextPage;
   private int transCnt;
   private List<InsuTransactionsDto> transList;
}
