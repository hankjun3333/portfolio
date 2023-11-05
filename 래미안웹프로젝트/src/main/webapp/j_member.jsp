<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Date dt2 = new Date();
    SimpleDateFormat sf2 = new SimpleDateFormat("yyyyMMddHHmmss");
    String date2 = sf2.format(dt2);
    %>
    <label class="mbship_title">
        <p>MEMBER-SHIP</p>
        <ul>
          <li style="color: #000;">01. 약관동의</li>
          <li><img src="./img/step_off.png" /></li>
          <li style="color: #1B9C9E;">02. 정보입력</li>
          <li><img src="./img/step_on.png" /></li>
          <li>03. 가입완료</li>
        </ul>
      </label>
      <form id="f" method="post" action="./join_memberok.do">
      <fieldset class="mbship_box">
        <h3>기본정보 입력 <span style="display: inline-block; font-size: 12px; vertical-align: 5px; float: right;">■ 표시는 필수 입력 항목입니다.</span></h3>
        <span class="agree_span">
        <ol class="mbinfos">
        <li><em class="ck_font">■</em> 이름</li>
        <li><input type="text" name="uname" class="mbinput1" placeholder="이름을 입력하세요"></li>
        <li><em class="ck_font">■</em> 아이디</li>
        <li>
        <input type="text" id="uid" name="uid" class="mbinput2" placeholder="6~12자의 아이디를 입력하세요">
        <button type="button" class="mb_btn1" onclick="idck()">중복확인</button>
        </li>
        <li><em class="ck_font">■</em> 비밀번호</li>
        <li>
        <input type="password" name="upass" class="mbinput3" placeholder="8~14자의 패스워드를 입력하세요">
        </li>
        <li><em class="ck_font">■</em> 비밀번호 확인</li>
        <li>
        <input type="password" id="passck" class="mbinput3" placeholder="동일한 패스워드를 입력하세요">
        </li>
        <li><em class="ck_font">■</em> 휴대전화번호</li>
        <li>
        <input type="text" id="utel" name="utel" class="mbinput2" placeholder="숫자만 입력하세요">
        <button type="button" class="mb_btn1" onclick="send_verification()">인증발송</button>
        </li>
        <li><em class="ck_font">■</em> 인증번호</li>
        <li>
        <input type="text" id="scode_ck" name="scode_ck" class="mbinput2" placeholder="숫자 6자리를 입력하세요" maxlength="6">
        <button type="button" id="verification" class="mb_btn1" onclick="verifyok_btn()">인증완료</button>
        </li>
        <li> 이메일</li>
        <li>
        <input type="text" id="email_input" name="uemail" class="mbinput3" placeholder="이메일을 입력하세요" onkeyup="inputval(this.value)">
        </li>
        <li style="height: 125px;"><em class="ck_font">■</em> 주소</li>
        <li style="height: 120px; line-height: normal; margin-top: 5px;">
        <input type="text" id="sample4_postcode" class="mbinput1" name="upost" placeholder="우편번호" maxlength="5" readonly>
        <button type="button" class="mb_btn1" onclick="sample4_execDaumPostcode()">주소찾기</button>
        <input type="text" id="sample4_roadAddress" class="mbinput4" name="ustreet_addr" placeholder="도로명 주소" readonly>
        <span id="guide" style="color:#999;display:none"></span>
        <input type="text" id="sample4_detailAddress" class="mbinput4" name="udetail_addr" placeholder="상세주소를 입력하세요" >
        </li>
        <li style="height: 100px;"> 마케팅 수신여부</li>
        <li style="height: 100px;">
        <!-- 이부분 다시 해보자! -->
        <label class="ck_label">
        
        <input type="checkbox" id="email_checkbox" value="Y" name="market_email" class="mbinput5" disabled>
         이메일 </label>
        <label class="ck_label">
        
        <input type="checkbox" id="tel_checkbox" name="market_tel" value="Y" class="mbinput5"> 전화 </label>
        <label class="ck_label">
        
        <input type="checkbox" id="post_checkbox" name="market_post" value="Y" class="mbinput5"> 우편물 </label>
        <label class="ck_label">
        
        <input type="checkbox" id="sms_checkbox" name="market_sms" value="Y" class="mbinput5">
        <!-- 이부분 다시 해보자! -->
         SMS (문자 메세지)</label><br>
        선택하신 정보 수신에 동의하겠습니다. (서비스, 이벤트 소식 등의 홍보/마케팅 정보를 수신하게 됩니다.)
        </li>
        </ol>
        </span>
        <span class="span_buttons">
        <button type="button" class="next_btn1_1" onclick="member_btn()">회원가입</button>
        <button type="button" class="next_btn2_1" onclick="cancel()">가입취소</button>
        </span>
      </fieldset>
      </form>
<script src="./js/j_member.js?v=<%=date2%>"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    //guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    //guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    function address(){
    	f.submit();
    }
</script>

    