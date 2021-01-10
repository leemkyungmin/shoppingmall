package com.lkm.shoppingmall.commom;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.lkm.shoppingmall.dto.KakaoPayApproval;
import com.lkm.shoppingmall.dto.KakaoPayReady;

import lombok.extern.java.Log;

@Service
@Log
public class Kakaopay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private  KakaoPayReady kakaoPayReady;
    
    private String oid = System.currentTimeMillis()+"";
    private String name  =null;
    String total_price =null;
    public  String kakaoPayReady(Map<String,Object> map) throws ParseException {
 
        RestTemplate restTemplate = new RestTemplate();
        
        String options =(String) map.get("options");
        JSONParser parser =new JSONParser();
        JSONArray arr=  (JSONArray) parser.parse(options);
        
        JSONObject obj = (JSONObject) arr.get(0);
        System.out.println(obj);
        
        String pname =obj.get("topponame")+" / "+obj.get("poname")+"외"+(arr.size()-1)+"건";
        name =(String) map.get("name");
        total_price =(String) map.get("total_price");
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK" + " 7633158fc86932e842faef8307930ea5");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", oid);
        params.add("partner_user_id", name);
        params.add("item_name", pname);
        params.add("quantity", "1");
        params.add("total_amount", total_price);
        params.add("tax_free_amount","0");
        params.add("approval_url", "http://localhost:9090/shoppingmall/product/buy/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:9090/shoppingmall/product/buy/kakaoPayCancel");
        params.add("fail_url", "http://localhost:9090/shoppingmall/product/buy/kakaoPaySuccessFail");
       	
        
        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         System.out.println(body);
        try {
        	
        	Map<String,Object> response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, Map.class);
        	System.out.println(response);
        	
        	kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);
        	log.info(""+kakaoPayReady);
            return kakaoPayReady.getNext_redirect_pc_url();

        	
        	/*Map<String,Object> response = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, Map.class);
        	System.out.println(response);
        	System.out.println(response.get("next_redirect_pc_url"));
        	return (String) response.get("next_redirect_pc_url");*/
            
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return "/product/buy/pay";
        
    }
    private  KakaoPayApproval kakaoPayApproval;
    
    public  KakaoPayApproval kakaoPayInfo(String pg_token) {
    	 
        
        
        RestTemplate restTemplate = new RestTemplate();
 
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "admin key를 넣어주세요~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
 
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReady.getTid());
        params.add("partner_order_id", oid);
        params.add("partner_user_id", name);
        params.add("pg_token", pg_token);
        params.add("total_amount",total_price );
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApproval = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApproval.class);

            return kakaoPayApproval;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return null;
    }
    
}
