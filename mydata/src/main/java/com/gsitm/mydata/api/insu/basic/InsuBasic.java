package com.gsitm.mydata.api.insu.basic;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Builder @AllArgsConstructor @NoArgsConstructor
@Getter @Setter @EqualsAndHashCode(of = "id") 
public class InsuBasic {

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    
    private String isRenewable;
    private String issueDate;
    private String expDate;
    private String faceAmt;
    private String currencyCode;
    private String isVariable;
    private String isUniversal;
    private String pensionRcvStartDate;
    private String pensionRcvCycle;
    private String isLoanable;
    private String insuredCount;
    private String insuredList;

}
