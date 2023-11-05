
function config_writeok(){
	if(cf.ctype.value==""){
		alert("주거 타입을 입력해주세요");
		cf.ctype.focus();
	}
	else if(cf.c_private.value==""){
		alert("주거 전용을 입력해주세요");
		cf.c_private.focus();
	}
	else if(cf.c_public.value==""){
		alert("주거 공용을 입력해주세요");
		cf.c_public.focus();
	}
	else if(cf.etc_public.value==""){
		alert("기타 공용을 입력해주세요");
		cf.etc_public.focus();
	}
	else if(cf.contract_area.value==""){
		alert("계약 면적을 입력해주세요");
		cf.contract_area.focus();
	}
	else if(cf.img_url.value==""){
		alert("이미지 경로를 입력해주세요");
		cf.img_url.focus();
	}
	else if(cf.display_order.value==""){
		alert("출력 순서를 입력해주세요");
		cf.display_order.focus();
	}
	else{
		var ck = /[0-9A-Z가-힣]/g;
		var ck1 = /[^0-9.]/;
		if(ck1.test(cf.c_private.value)){
			alert("숫자만 입력해주세요");
			cf.c_private.focus();
		}
		else if(ck1.test(cf.c_public.value)){
			alert("숫자만 입력해주세요");
			cf.c_public.focus();
		}
		else if(ck1.test(cf.etc_public.value)){
			alert("숫자만 입력해주세요");
			cf.etc_public.focus();
		}
		else if(ck1.test(cf.contract_area.value)){
			alert("숫자만 입력해주세요");
			cf.contract_area.focus();
		}
		else if(ck1.test(cf.display_order.value)){
			alert("숫자만 입력해주세요");
			cf.display_order.focus();
		}
		else{
			cf.submit();
		}				
	}
}

