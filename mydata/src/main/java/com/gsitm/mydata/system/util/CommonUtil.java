package com.gsitm.mydata.system.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import lombok.extern.slf4j.Slf4j;

/**
  * @ClassName : CommonUtil.java
  * @Date : Apr 14, 2020 
  * @�ۼ��� : 86751
  * @���α׷� ���� :
  * @�����̷� :
  */
@Slf4j
public class CommonUtil {
	
	//���� ���� PC/MB
	final static String TRAN_PC = "CYBER";  
    final static String TRAN_MB = "CYBER_M";  
    
    
  //IP ���� �޾ƿ��� 
    public static String getRemoteIP(){
       
       HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
       String ip = req.getHeader("X-FORWARDED-FOR");
       if (isEmpty(ip)) ip = req.getRemoteAddr();
           // ������ iv6������� �Ѿ�� ���
           if(ip.equals("0:0:0:0:0:0:0:1")) ip = "127.0.0.1";
           // ���ڿ� �ڸ� ó��
           String[] ipList = ip.trim().split(",");
           if(ipList.length > 1){
               return ipList[0];
           }else{
               return ipList[0];
           }
    }
    
    
    public static void sendMessage(String msg)
    {
        HttpServletResponse httpResponse = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getResponse();
        httpResponse.setContentType("text/html; charset=utf-8");
        httpResponse.setHeader("pragma", "no-cache");
        httpResponse.setHeader("cache-control", "no-cache");
        httpResponse.setHeader("expires", "0");
        PrintWriter out = null;
        
        try
        {
            out = httpResponse.getWriter();
        }
        catch(IOException e)
        {
            //logger.error("IGNORE:", e);   // 2017.01.02 �������� �ļ���ġ*/
        }
        if(msg == null || msg == "null"){
            out.println("{}");
        }else{
            out.println(msg);
        }
        
        out.flush();
        out.close();
    }
    
    public static void sendJson(String jsonString)
    {
        HttpServletResponse httpResponse = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getResponse();
        httpResponse.setContentType("application/json; charset=UTF-8");
        httpResponse.setHeader("pragma", "no-cache");
        httpResponse.setHeader("cache-control", "no-cache");
        httpResponse.setHeader("expires", "0");
        PrintWriter out = null;
        
        try
        {
            out = httpResponse.getWriter();
        }
        catch(IOException e)
        {
            //logger.error("IGNORE:", e);   // 2017.01.02 �������� �ļ���ġ*/
        }
        out.println(jsonString);
        out.flush();
        out.close();
    }
    
    
    public static void sendJsonObj(JSONObject jObj)
    {
        HttpServletResponse httpResponse = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getResponse();
        httpResponse.setContentType("application/json");
        httpResponse.setHeader("pragma", "no-cache");
        httpResponse.setHeader("cache-control", "no-cache");
        httpResponse.setHeader("expires", "0");
        PrintWriter out = null;
        
        try
        {
            out = httpResponse.getWriter();
        }
        catch(IOException e)
        {
            //logger.error("IGNORE:", e);   // 2017.01.02 �������� �ļ���ġ*/
        }
        out.println(jObj);
        out.flush();
        out.close();
    }
    
    public static String getCommaMoney(String p_money) {
        String money = (("").equals(p_money) ? "" : p_money);
        if(money!=null){ //ȭ�� ���� ������ ���� �޸� ���
            DecimalFormat dc = new DecimalFormat("###,###,###,###");
            money = dc.format(Double.parseDouble(money));
        }
        return money;
    }

    public static String getUserIP() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (isEmpty(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (isEmpty(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (isEmpty(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (isEmpty(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (isEmpty(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (isEmpty(ip)) {
            ip = request.getHeader("X-RealIP");
        }
        if (isEmpty(ip)) {
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (isEmpty(ip)) {
            ip = request.getRemoteAddr();
        }
        
        //logger.error("#### ip ::[{}] ",ip);
        // ������ iv6������� �Ѿ�� ���
        if(ip.equals("0:0:0:0:0:0:0:1")) ip = "127.0.0.1";
        return ip;
    }
    /**
     * Home Of LangCd > Admin Of LangCd
     * @param homeLangCd
     * @return
     */
    public static String changeLangCdHomeToAdmain(String homeLangCd) {
        String adminLangCd = "";
        
        switch (homeLangCd) {
        case "ko_KR":
            adminLangCd = "KR";
            break;
        case "en":
            adminLangCd = "US";
            break;
        case "ja":
            adminLangCd = "JP";
            break;
        case "cn":
            adminLangCd = "CNS";
            break;
        case "cn2":
            adminLangCd = "CNT";
            break;
        default:
            adminLangCd = "KR";
            break;
        }
        return adminLangCd;
    }
    /**
     * Admin Of LangCd > Home Of LangCd 
     * @param adminLangCd
     * @return
     */
    public static String changeLangCdAdminToHome(String adminLangCd) {
        String homeLangCd = "";
        
        switch (adminLangCd) {
        case "KR":
            homeLangCd = "ko_KR";
            break;
        case "US":
            homeLangCd = "en";
            break;
        case "JP":
            homeLangCd = "ja";
            break;
        case "CNS":
            homeLangCd = "cn";
            break;
        case "CNT":
            homeLangCd = "cn2";
            break;
        default:
            homeLangCd = "ko_KR";
            break;
        }
        return homeLangCd;
    }
    
    public static boolean uriCheck(String requestUri, String patten){
        int resultCnt = requestUri.indexOf(patten);
        return resultCnt > 0 ? true : false;
    }
    
    //������
    public static int getAge(int birthYear, int birthMonth, int birthDay)
    {
        Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
        
        int age = currentYear - birthYear;
        // ���� �� ���� ��� -1
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay){
            age--;
        }
        
        return age;
    }
    
    
    public static boolean isEmpty(String str) {
        return str == null || str.length() == 0;
    }
    
    /**
      * @Method Name : set
      * @�ۼ��� : 2020. 5. 15.
      * @�ۼ��� : 86751
      * @Method ���� : ���� Ű���� ������ ���ʰ� ����
      *
      * @param obj
      * @param key
      * @param def
      * @return
      */
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> T set(Map obj, String key, Object def){
    	Object rslt = null;
    	Object vObj = null;
    	if((vObj = obj.get(key)) != null){
    		rslt = vObj;
    	}else{
    		obj.put(key, def);
    		rslt = def;
    	}
    	return (T) rslt;
    }
    
    @SuppressWarnings({ "unchecked", "rawtypes" })
    public static <T> T get(Map obj, String key, Object def){
    	return set(obj, key, def);
    }
    
    @SuppressWarnings("rawtypes")
	public static <T> T get(Map obj, String key){
    	return set(obj, key, null);
    }
    
    @SuppressWarnings("unchecked")
    public static ArrayList<Map<String,Object>> convertJsonToMap(ArrayList<?> paramList) throws Exception{
        ArrayList<Map<String,Object>> resultList = new ArrayList<>();
        
        if(paramList!=null && paramList.size() > 0){
            for(Object obj : paramList){                
                Map<String,Object> map = (Map<String,Object>)obj;
                resultList.add(map);
            }
        }
        
        return resultList;
    }
    
    /**
      * @Method Name : getUserInfoMap
      * @�ۼ��� : 2020. 7. 7.
      * @�ۼ��� : 86751
      * @Method ���� : userinfo map ���� ��������
      *
      * @return
      */
    public static HashMap getUserInfoMap() {
    	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
    	return getUserInfoMap(req);
    }
    
    /**
      * @Method Name : getUserInfoMap
      * @�ۼ��� : 2020. 7. 7.
      * @�ۼ��� : 86751
      * @Method ���� :
      *
      * @param req
      * @return
      */
    public static HashMap getUserInfoMap(HttpServletRequest req) {
    	HashMap fbUserInfoMap = (HashMap) req.getSession().getAttribute("fbUserInfo");
    	if(fbUserInfoMap == null) fbUserInfoMap = new HashMap<>();
    	return fbUserInfoMap;
    }
    
    
    
    /**
     * @Method Name : getUserInfoMap
     * @�ۼ��� : 2020. 7. 7.
     * @�ۼ��� : 86751
     * @Method ���� : userinfo map ���� ��������
     *
     * @return
     */
   public static HashMap getUserInfoCookieMap() {
   	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
   	return getUserInfoCookieMap(req);
   }
   
   /**
     * @Method Name : getUserInfoMap
     * @�ۼ��� : 2020. 7. 7.
     * @�ۼ��� : 86751
     * @Method ���� :
     *
     * @param req
     * @return
     */
   public static HashMap getUserInfoCookieMap(HttpServletRequest req) {
	   	HashMap fbUserInfoCookie = (HashMap) req.getSession().getAttribute("fbUserInfoCookie");
	   	if(fbUserInfoCookie == null) fbUserInfoCookie = new HashMap<>();
	   	return fbUserInfoCookie;
   }
    
    /**
      * @Method Name : getContext
      * @�ۼ��� : 2020. 5. 22.
      * @�ۼ��� : 86751
      * @Method ���� : Spring �����̳� �̿ܿ��� Beanȣ���ϱ�
      * ex > getContext().getBean("Bean�̸�");
      *
      * @return
      */
    public static WebApplicationContext getContext(){
    	//request��������
    	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
    	
    	//���ǰ�������
    	HttpSession httpSession = req.getSession();
    	
    	//ServletContext ��������
    	ServletContext svlc = httpSession.getServletContext();
    	
    	//SrpingContext ��������
    	WebApplicationContext wContext = WebApplicationContextUtils.getRequiredWebApplicationContext(svlc);
    	
    	return wContext;
    }
    
    
    public static boolean checkArrCompare(String[] orgArr, String[] comArr){
    	for(int i=0;i<orgArr.length;i++){
    		if(!orgArr[i].equals("")){
//    			System.out.println("orgArr[i]=="+orgArr[i]);
    			for(int j=0;j<comArr.length;j++){
//    				System.out.println("comArr[j]=="+comArr[j]);
    				if(orgArr[i].equals(comArr[j])){
    					return true;
    				}
    			}
    		}
    	}
    	return false;
    }
    
    /**
      * @Method Name : deviceInfo
      * @�ۼ��� : 2020. 6. 17.
      * @�ۼ��� : 86751
      * @Method ���� : ���� device���� Ȯ��
      *
      * @return
      */
    public static String deviceInfo() {
    	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
    	String dInfo = String.valueOf(req.getAttribute("deviceInfo"));
    	if(dInfo.equals("")){
    		dInfo = "PC";
    	}
    	return dInfo;
    }
    
    /**
      * @Method Name : deviceInfo
      * @�ۼ��� : 2020. 6. 17.
      * @�ۼ��� : 86751
      * @Method ���� : ���� device���� Ȯ��
      *
      * @param req
      * @return
      */
    public static String deviceInfo(HttpServletRequest req) {
    	String dInfo = String.valueOf(req.getAttribute("deviceInfo"));
    	if(dInfo.equals("")){
    		dInfo = "PC";
    	}
    	return dInfo;
    }
    
    
    /**
      * @Method Name : chkDevice
      * @�ۼ��� : 2020. 7. 23.
      * @�ۼ��� : 86751
      * @Method ���� : userAgent�� ����̽� üũ
      *
      * @param userAgent
      * @return
      */
    public static String chkDevice(String userAgent){
    	String tmpDevice = "PC";
    	if(userAgent.toUpperCase().contains("ANDROID") || userAgent.toUpperCase().contains("IPHONE") 
    			|| userAgent.toUpperCase().contains("IPAD") || userAgent.toUpperCase().contains("IPOD")){
    		tmpDevice = "MB";
    	}
    	return tmpDevice;
    }
    
    
    /**
      * @Method Name : tranDevice
      * @�ۼ��� : 2020. 7. 20.
      * @�ۼ��� : 86751
      * @Method ���� :  device�� ���� ���� ���̵�
      *
      * @param req
      * @return
      */
    public static String tranDevice(HttpServletRequest req) {
    	if(deviceInfo(req).equals("PC")){
    		return TRAN_PC;
    	}else{
    		return TRAN_MB;
    	}
    }
    /**
      * @Method Name : tranDevice
      * @�ۼ��� : 2020. 7. 20.
      * @�ۼ��� : 86751
      * @Method ���� : device�� ���� ���� ���̵�
      *
      * @return
      */
    public static String tranDevice() {
    	HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
    	return tranDevice(req);
    }
    
    /**
      * @Method Name : isEmpty
      * @�ۼ��� : 2020. 5. 25.
      * @�ۼ��� : 86751
      * @Method ���� : obj nullüũ
      *
      * @param obj
      * @return
      */
    @SuppressWarnings("rawtypes")
    public static boolean isObjEmpty(Object obj) {
      boolean rslt = false;
      // @formatter:off
      rslt = (obj == null) ? (true)
          : (obj instanceof Object[]) ? (((Object[]) obj).length == 0) //
              : (obj instanceof String) ? (obj.toString().trim().length() == 0)
                  : (obj instanceof Boolean) ? (false) //
                      : (obj instanceof Double) ? (((Double) obj).isNaN() || ((Double) obj).isInfinite()) //
                          : (obj instanceof Float) ? (((Float) obj).isNaN() || ((Float) obj).isInfinite()) //
                              : (obj instanceof Number) ? (false) //
                                  : (obj instanceof Map) ? (((Map) obj).size() == 0) // .isEmpty() { return size == 0; }
                                      : (obj instanceof Collection) ? (((Collection) obj).size() == 0) // .isEmpty() {
                                                                                                       // return size ==
                                                                                                       // 0; }
                                          : (obj.toString().trim().length() == 0);
      // @formatter:on
      return rslt;
    }
    
    public static String getClientIP(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = request.getHeader("X-Forwarded-For");
        if(ip == null){
            ip = request.getHeader("Proxy-Client-IP");
        }
        if(ip == null){
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if(ip == null){
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if(ip == null){
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if(ip == null){
            ip = request.getRemoteAddr();
        }
        return ip;
    }
    
    private static String makeEncString(String value) {
        // BB ����� �ϵ��ڵ��� �������� �ʿ信 ���� �ƽ�Ÿ ó���� ����
        return "*********";
    }
    
    /**
     * ���� 
     * @param sexCd
     * @return
     */
    public static String GetSexType(String sexNo){
        if(sexNo == null || sexNo == "") return "";
        String rtnVal = "";
        
        if(sexNo.charAt(0) == '1'){
            rtnVal = "M";           
        }else if(sexNo.charAt(0) == '2'){
            rtnVal = "F";           
        }
        
        return rtnVal;
    }
    
    
    public static boolean isNumeric(String s){
        Pattern pattern =Pattern.compile("[+-]?\\d+");
        return pattern.matcher(s).matches();
    }
    
    /**
     * �ֹι�ȣ ����
     * @param code
     * @return
     */
    public static boolean IsJuminNum(String code){
        boolean IsJuminNum = false;
        
        if(code.length() == 13 && isNumeric(code)){         
            int sexCode = Integer.parseInt(code.substring(6,7));
            
            //if(Integer.parseInt(code.substring(4,6)) < 13 && Integer.parseInt(code.substring(6,8)) < 32 && sexCode > 0 && sexCode < 5){
            if(Integer.parseInt(code.substring(4,6)) < 13    && sexCode > 0 && sexCode < 5){
                IsJuminNum = true;
            }else{
                IsJuminNum = false;
            }
        }else{
            IsJuminNum = false;
        }
        return IsJuminNum;
    }
    
    /**
     * ���質�̻��� 
     * @param juminNum
     * @return
     */
    public static Map InsuAge(String juminNum){
        Map resMap = new HashMap();
        int age;
        int bornCentury=0, bornYear, bornMonth, bornDate, ageYear, ageMonth, totalMonth;
        String sexFlag = "";
        
        //�ֹι�ȣ ��ȿ��üũ...
        if(IsJuminNum(juminNum)){
            sexFlag     = juminNum.substring(6,7);  //�����ڵ�
            bornYear    = Integer.parseInt(juminNum.substring(0,2));    //����
            bornMonth   = Integer.parseInt(juminNum.substring(2,4));    //����
            bornDate    = Integer.parseInt(juminNum.substring(4,6));    //����

            //��� ����
            switch (sexFlag.charAt(0)){
            case '1':   bornCentury = 1900; break;
            case '2':   bornCentury = 1900; break;
            case '3':   bornCentury = 2000; break;
            case '4':   bornCentury = 2000; break;
            }
            
            ageYear = Integer.parseInt(DateUtil.getCurrDate("yyyy")) - (bornCentury + bornYear);
            ageMonth = Integer.parseInt(DateUtil.getCurrDate("MM")) - bornMonth;
            totalMonth = (ageYear * 12) + ageMonth;
            
            //������ ������ ������� �Ѵ� ����
            if(Integer.parseInt(DateUtil.getCurrDate("dd")) < bornDate){
                totalMonth = totalMonth - 1;
            }
                    
            //������� �ܿ������� 6�����̻��̸� �ѻ��߰�
            if((totalMonth%12) > 5){
                age = totalMonth/12 + 1;
            }else{
                age = totalMonth/12;
            }
        }else{
            age = -1;
        }
        resMap.put("age", age);
        resMap.put("sex", GetSexType(sexFlag));
        return resMap;
    }
    
    
    /**
      * @Method Name : resetTranSessionId
      * @�ۼ��� : 2020. 9. 5.
      * @�ۼ��� : 86751
      * @Method ���� : �Ⱓ�� �������� �ʱ�ȭ
      *
      * @param req
      */
    public static void resetTranSessionId(HttpServletRequest req){
    	log.debug(">>>>> fbUserInfo �ʱ�ȭ <<<<<");
    	req.getSession().setAttribute("fbUserInfo", new HashMap<String, Object>());
    	req.getSession().setAttribute("fbUserInfoCookie", new HashMap<String, Object>());
    }
}
