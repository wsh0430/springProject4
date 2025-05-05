package com.spring.springProject4.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {

    public boolean sendMessage(String tel, String randomNumber) {
        String api_key = "NCSHHLAXUYB9XTRT";
        String api_secret = "KTM9EALGEKIHT71BF1TJF67DDZNEL00W";

        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<>();
        params.put("to", tel); // 수신자 번호
        params.put("from", "010-5527-1398"); // 본인의 발신 가능한 번호
        params.put("type", "SMS");
        params.put("text", "[HITBox] 본인확인 인증번호 (" + randomNumber + ") 를 입력하세요.");
        params.put("app_version", "JAVA SDK v2.2");

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println("SMS 전송 응답: " + obj.toString());
            return true;
        } catch (CoolsmsException e) {
            System.out.println("SMS 전송 실패: " + e.getMessage());
            System.out.println("에러 코드: " + e.getCode());
            return false;
        }
    }
}