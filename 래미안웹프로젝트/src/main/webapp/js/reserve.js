function reserveok(){
	if(f.reserve_date.value==""){
		alert("예약 일자를 입력해주세요");
	}
	else if(f.reserve_time.value==""){
		alert("예약 시간을 선택해주세요");
	}
	else{
      var today = new Date();
        var year = today.getFullYear().toString().padStart(2,'0'); // 연
        var month = String(today.getMonth()+1).padStart(2, '0');  // 월
        var day = today.getDate().toString().padStart(2,'0');     // 일
        var hour = today.getHours().toString().padStart(2,'0');
        var min = today.getMinutes().toString().padStart(2,'0');
        
        var currentDatetime = year + month + day + hour + min;
        
        var kk = f.reserve_date.value.replaceAll(/-/g,"");
        var reserve_time = document.getElementById("reserve_time").value;
        var reserve_time2 = reserve_time.replaceAll(/:/g,"");
        // 시간 값을 HHmm 형식으로 바꾸는 부분
        var timeComponents = reserve_time.split(":");
        reserve_time = timeComponents[0] + timeComponents[1];
        
        var usertime = year + month + day + reserve_time2;
        console.log(currentDatetime);
        
        console.log(usertime);
        if(kk < year + month + day) {
            alert("예약날짜가 현재 기준 전날입니다.");
        }
        else if(kk + reserve_time2 < currentDatetime){
            alert("예약 시간이 현재 기준 전 시간입니다.");
        }
        else {
            f.submit();
        }
	}
}
