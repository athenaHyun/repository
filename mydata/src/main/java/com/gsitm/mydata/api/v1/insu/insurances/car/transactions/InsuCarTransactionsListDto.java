package com.gsitm.mydata.api.v1.insu.insurances.car.transactions;

import java.util.List;

import lombok.*;

@Data
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter
public class InsuCarTransactionsListDto {
   private String rspCode;
   private String rspMsg;
   private String nextPage;
   private int transCnt;
   private List<InsuCarTransactionsDto> transList;
}
