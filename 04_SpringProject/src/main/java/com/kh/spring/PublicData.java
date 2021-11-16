package com.kh.spring;

/* Java 샘플 코드 */


import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class PublicData {
    public static void main(String[] args) throws IOException {
        StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_pblprfr_event_info_api"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=2Jf6Fx1AnY1m8BJg7GDSmUhPlsmDOK0cv9y2o2gZGq%2BDPKLLzfP%2BhCkO4x92tphFvfLu808BsRerc9v41NGDbQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /*XML/JSON 여부*/
        urlBuilder.append("&" + URLEncoder.encode("eventNm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*행사명*/
        urlBuilder.append("&" + URLEncoder.encode("opar","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*장소*/
        urlBuilder.append("&" + URLEncoder.encode("eventCo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*행사내용*/
        urlBuilder.append("&" + URLEncoder.encode("eventStartDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*행사시작일자*/
        urlBuilder.append("&" + URLEncoder.encode("eventEndDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*행사종료일자*/
        urlBuilder.append("&" + URLEncoder.encode("eventStartTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*행사시작시각*/
        urlBuilder.append("&" + URLEncoder.encode("eventEndTime","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*행사종료시각*/
        urlBuilder.append("&" + URLEncoder.encode("chrgeInfo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*요금정보*/
        urlBuilder.append("&" + URLEncoder.encode("mnnst","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주관기관*/
        urlBuilder.append("&" + URLEncoder.encode("auspcInstt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주최기관*/
        urlBuilder.append("&" + URLEncoder.encode("phoneNumber","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*전화번호*/
        urlBuilder.append("&" + URLEncoder.encode("suprtInstt","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*후원기관*/
        urlBuilder.append("&" + URLEncoder.encode("seatNumber","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*객석수*/
        urlBuilder.append("&" + URLEncoder.encode("admfee","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*관람요금*/
        urlBuilder.append("&" + URLEncoder.encode("entncAge","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*입장연령*/
        urlBuilder.append("&" + URLEncoder.encode("dscntInfo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*할인정보*/
        urlBuilder.append("&" + URLEncoder.encode("atpn","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*유의사항*/
        urlBuilder.append("&" + URLEncoder.encode("homepageUrl","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*홈페이지주소*/
        urlBuilder.append("&" + URLEncoder.encode("advantkInfo","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*예매정보*/
        urlBuilder.append("&" + URLEncoder.encode("prkplceYn","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*주차장보유여부*/
        urlBuilder.append("&" + URLEncoder.encode("rdnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소재지도로명주소*/
        urlBuilder.append("&" + URLEncoder.encode("lnmadr","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*소재지지번주소*/
        urlBuilder.append("&" + URLEncoder.encode("latitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*위도*/
        urlBuilder.append("&" + URLEncoder.encode("longitude","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*경도*/
        urlBuilder.append("&" + URLEncoder.encode("referenceDate","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*데이터기준일자*/
        urlBuilder.append("&" + URLEncoder.encode("instt_code","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관코드*/
        urlBuilder.append("&" + URLEncoder.encode("instt_nm","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*제공기관기관명*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());
    }
}