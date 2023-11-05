let adds = document.querySelector("#member_add");
adds.addEventListener("click",function(){
	   location.href="./admin_ship.jsp";
   
});
function login_btn(){
   if(member_log.mid.value==""){
	   alert("아이디를 입력해주세요");
	   return false;
   }
   else if(member_log.mpass.value==""){
	   alert("비밀 번호를 입력해주세요");
	   return false;
   }
   else{
	   return true;
   }
}