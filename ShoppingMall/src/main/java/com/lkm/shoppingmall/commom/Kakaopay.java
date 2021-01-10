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

import com.google.gson.JsonObject;
import com.lkm.shoppingmall.dto.KakaoPayReady;

public class kakaopay {
 
    private static final String HOST = "https://kapi.kakao.com";
    
    private static KakaoPayReady kakaoPayReady;
    
    public static String kakaoPayReady(Map<String,Object> map) throws ParseException {
 
        RestTemplate restTemplate = new RestTemplate();
        
        String options =(String) map.get("options");
        JSONParser parser =new JSONParser();
        JSONArray arr=  (JSONArray) parser.parse(options);
        
        JSONObject obj = (JSONObject) arr.get(0);
        System.out.println(obj);
        
        String pname =obj.get("topponame")+" / "+obj.get("poname")+"외"+(arr.size()-1)+"건";
        
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK" + " 7633158fc86932e842faef8307930ea5");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", System.currentTimeMillis()+"");
        params.add("partner_user_id", "kane9529");
        params.add("item_name", pname);
        params.add("quantity", "1");
        params.add("total_amount", (String) map.get("total_price"));
        params.add("tax_free_amount","0");
        params.add("approval_url", "http://localhost:9090/shoppingmall/product/buy/kakaoPaySuccess");
        params.add("cancel_url", "http://localhost:9090/shoppingmall/product/buy/kakaoPayCancel");
        params.add("fail_url", "http://localhost:9090/shoppingmall/product/buy/kakaoPaySuccessFail");
       	
        
        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
         System.out.println(body);
        try {
        	kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);
            return kakaoPayReady.getNext_redirect_pc_url();
            
        } catch (RestClientException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/product/buy/pay";
        
    }
    
}
