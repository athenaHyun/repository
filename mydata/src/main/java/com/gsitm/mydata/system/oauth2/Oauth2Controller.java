package com.gsitm.mydata.system.oauth2;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gsitm.mydata.system.util.CommonUtil;
 
@Controller
public class Oauth2Controller {
 
    @RequestMapping("/apiMain")
    public String apiMain() throws Exception {
        return "apiMain";
    }
    
    @RequestMapping("/oauth2")
    public String oauth2() throws Exception {
        return "oauth2";
    }
    
    @RequestMapping("/oauth2/callback")
    public String oauth2CallBack(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> paramMap) throws Exception {	
		System.out.println("paramMap : " + paramMap);
        return "oauth2CallBack";
    }
    
    @RequestMapping("/oauth2/callback/auth")
    public String oauth2CallBackAuth(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> paramMap) throws Exception {	
		System.out.println("oauth2CallBackAuth : " + paramMap);
        return "oauth2CallBackAuth";
    }
    
    @RequestMapping("/oauth2TokenProc")
    public void oauth2TokenProc(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> paramMap) throws Exception {
        JSONObject returnObj = new JSONObject();
        try{
            String oauth2Url = "https://testapi.openbanking.or.kr/oauth/2.0/token";
            
            HttpPost httpPost = new HttpPost(oauth2Url);
            httpPost.setHeader("Accept", "application/json");
            httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");

            List<NameValuePair> postParams = new ArrayList<NameValuePair>();
            postParams.add(new BasicNameValuePair("code", (String)paramMap.get("code")));
            postParams.add(new BasicNameValuePair("client_id", (String)paramMap.get("client_id")));
            postParams.add(new BasicNameValuePair("client_secret", (String)paramMap.get("client_secret")));
            postParams.add(new BasicNameValuePair("redirect_uri", (String)paramMap.get("redirect_uri")));
            postParams.add(new BasicNameValuePair("grant_type", (String)paramMap.get("grant_type")));
            //Post ����� ��� �����͸� Request body message�� ����
            HttpEntity postEntity = new UrlEncodedFormEntity(postParams, "UTF-8");
            httpPost.setEntity(postEntity);

            CloseableHttpClient httpClient = HttpClientBuilder.create().build();
            CloseableHttpResponse httpResponse = httpClient.execute(httpPost);

            if (httpResponse.getStatusLine().getStatusCode() == 200) {

                ResponseHandler<String> handler = new BasicResponseHandler();
                String body = handler.handleResponse(httpResponse);

                JSONParser parser = new JSONParser();
                Object obj = parser.parse( body );
                JSONObject jsonObj = (JSONObject) obj;
                returnObj.put("data", jsonObj);
                System.out.println("jsonObj : " + jsonObj);
            }
        }catch(Exception e){
            if( e.getMessage() != null ){
            	returnObj.put("message", e.getMessage());
            }else{
                e.printStackTrace();
            }
        }
        CommonUtil.sendMessage(returnObj.toJSONString());
    }
    
	@RequestMapping("/apiCall")
    public String apiCall(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> paramMap) throws Exception {	
    	
        return "apiCall";
    }
	
    @RequestMapping("/apiCallProc")
    public void apiCallProc(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String, Object> paramMap) throws Exception {
        JSONObject returnObj = new JSONObject();
        try{
            String paramUrl = (String)paramMap.get("apiUrl");
            String strParam = (String)paramMap.get("strParam");
            String Authorization = (String)paramMap.get("Authorization");
			String apiUrl = "https://testapi.openbanking.or.kr/v2.0/" + paramUrl;
			String fullUrl = apiUrl + strParam;
			
			CloseableHttpClient httpClient = HttpClientBuilder.create().build();
			HttpGet httpGet = new HttpGet(fullUrl);

	        // add request headers
			httpGet.addHeader("Authorization", "Bearer " + Authorization);
	        
	        CloseableHttpResponse httpResponse = httpClient.execute(httpGet);

	        if (httpResponse.getStatusLine().getStatusCode() == 200) {

	            ResponseHandler<String> handler = new BasicResponseHandler();
	            String body = handler.handleResponse(httpResponse);

	            JSONParser parser = new JSONParser();
	            Object obj = parser.parse( body );
	            JSONObject jsonObj = (JSONObject) obj;
	            returnObj.put("data", jsonObj);
	            System.out.println("jsonObj : " + jsonObj);
	        }
        }catch(Exception e){
            if( e.getMessage() != null ){
            	returnObj.put("message", e.getMessage());
            }else{
                e.printStackTrace();
            }
        }
        CommonUtil.sendMessage(returnObj.toJSONString());
    }
}

