package portfolio;

import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.annotation.Resource;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Repository("reserve")
public class reserve_module {

	@Resource(name="sqlsession")
	private SqlSessionTemplate tm;
	
	public int reserve_ok(reservedto reservedto) {
		reservedto.setRcount("1");
		int result = this.tm.insert("memberDB.reserve_insert",reservedto);
		
		return result;
	}
	
	public int user_ck(String uid) {
		int userck = this.tm.selectOne("memberDB.reserve_userck",uid);
		System.out.println(userck);
		return userck;
	}
	
	
	
	//서비스 아이디 --개인정보라서 삭제합니다.
		private String service_id  = "";
		private String access_id = "";
		private String Secret_key = "";
		private String service = "SMS"; //SMS , LMS , MMS 
		private String url = "https://sens.apigw.ntruss.com/sms/v2/services/"+service_id+"/messages";
		private String url2 = "/sms/v2/services/"+service_id+"/messages"; //SHA 암호화에서 사용
		
		private Long timestamp = null;
		 //발송시간
		
		
	
	
	@SuppressWarnings("unchecked")
	public int code_oksing(String usertel,String scode) throws Exception{
		 timestamp = System.currentTimeMillis();
		
		int oksign = 0;
		JSONObject code1 = new JSONObject();
		JSONObject code2 = new JSONObject();
		JSONArray code3 = new JSONArray();
		code1.put("type", "SMS");
		code1.put("countryCode", "82");
		code1.put("from", "01073317701");
		code1.put("contentType", "COMM");
		code1.put("content", "이벤트 내용 문자발송"); //관리자가 확인하는 메세지 내용
		code2.put("content", "인증번호는 : "+scode+"입니다."); //클라이언트가 받을 메세지 내용!
		code2.put("to", usertel);
		code3.add(code2);
		code1.put("messages",code3);
		String data = code1.toString(); //해당 배열을 문자화로 변경!
		
		System.out.println(data);
		
		//header 제작 코드 (curl-리눅스 명령어) - > 클라이언트에서 서버 통신할수 있는 명령어 툴
		//OkHttpClient 통해서 POST,GET 통신 공부 필수!! - > 실무에서 많이씀!!
		OkHttpClient client = new OkHttpClient(); //꼭 공부해보자!!
		
		Request req = new Request.Builder()
				.addHeader("x-ncp-apigw-timestamp", timestamp.toString())
				.addHeader("x-ncp-iam-access-key", access_id)
				.addHeader("x-ncp-apigw-signature-v2", makese()) //SHA로 변환된 값을 적용!
				.url(url)
				.post(RequestBody.create(MediaType.parse("application/json"),data)) //POST로 전송
				.build(); //curl 요청사항을 제작하는 부분임!	
		//이 이후에 응답을받아야 됨 콜이 되었는지? 안되었는지?
		
		System.out.println(timestamp);
		
		
		Response res = client.newCall(req).execute(); //Naver API로 전송 실행 및 응답!
		String result = res.body().string(); // 문자열로 확인!
		System.out.println(result);
		if(result.indexOf("202")>0) {
			System.out.println("전송 완료");
			oksign = 1;
		}
		else {
			//System.out.println(result.indexOf("202"));
			oksign = 0;
		}
		return oksign;
	}
	
	//Base64, SHA
	public String makese() {
		String sp = " ";
		String line = "\n";
		String msg = new StringBuilder()
				.append("POST")
				.append(sp)
				.append(url2)
				.append(line)
				.append(timestamp)
				.append(line)
				.append(access_id)
				.toString();
		SecretKeySpec key;
		String base64="";
		try {
			key = new SecretKeySpec(Secret_key.getBytes("UTF-8"), "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(key);
			byte[] rawHmac = mac.doFinal(msg.getBytes("UTF-8"));
			base64 = Base64.getEncoder().encodeToString(rawHmac);
		}
		catch(Exception e) {
			System.out.println(e); //암호화 오류발생
			base64 = "";
		}
		return base64;
	}
	public reservedto reserve_ck(String userid) {
		reservedto r_dto = this.tm.selectOne("memberDB.reserve_ck",userid);
		System.out.println(r_dto);
		return r_dto;
	}
	
	public int reserve_update(reservedto reservedto) {
		int result = this.tm.update("memberDB.reserve_update",reservedto);
		
		return result;
	}
	public int reserve_count(reservedto reservedto) {
		int result = this.tm.update("memberDB.reserve_btn",reservedto);
		return result;	
	}
	
	public List<reservedto> reserve_list(String part, String data,int vpage){
		List<reservedto> lists = null;
		if(data==null || data=="") {
			part=null;
			lists=this.tm.selectList("memberDB.reserve_userlist",vpage);
		}
		else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("part", part);
			map.put("data", data);
			map.put("vpage", vpage);
			lists = this.tm.selectList("memberDB.reserve_userlist_map",map);
		}
		//List<userdto> lists = this.tm.selectList("memberDB.user_list");
		//System.out.println(lists);
		return lists;
	}
	public List<reservedto> admain_reserve_list(){
		List<reservedto> lists = this.tm.selectList("memberDB.reserve_alllist");
		
		return lists;
	}
	
	
	
	
	
	
	public String reserve_count(String part, String data) {
		String count="";
		if(data == null || data=="") {
			part =null;
			count = this.tm.selectOne("memberDB.reserve_user_count");
		}
		else {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("part", part);
			map.put("data", data);
			count = this.tm.selectOne("memberDB.reserve_user_countmap",map);
		}
		
		return count;
	}
	public int reserve_dont(String ridx) {
		int result = this.tm.update("memberDB.reserve_delete",ridx);
		//System.out.println(result);
		return result;
	}
	public int reserve_dont_id(String userid) {
		int result = this.tm.update("memberDB.reserve_delete_id",userid);
		//System.out.println(result);
		return result;
	}	
	
}
