function reserve_del(z){
	if(confirm("정말 취소하시겠습니까? 삭제시 예약 정보를 복구할 수 없습니다.")){
		location.href = "./client_reserve_cancelok.do?userid="+z;
	}
	
}