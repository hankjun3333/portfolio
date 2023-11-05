/*document.querySelector("#faq_field").addEventListener("click",function(z){
	var n = document.querySelectorAll("#faq_field > .node");
	this.node = [].indexOf.call(n,z.srcElement.parentNode); // li 자식 노드에서 부모 노드를 찾아서 확인
	
	//Answer의 갯수
	this.ea = document.querySelectorAll("#faq_field > .answer_field").length;
	
	var w = 0;
	//해당 모든 Answer의 display를 숨김
	while(w< this.ea){
		document.querySelectorAll("#faq_field > .answer_field")[w].style["display"] = "none";
		w++;
	}
	//해당 q에 대한 Answer 값만 출력
	document.querySelectorAll("#faq_field > .answer_field")[this.node].style["display"] = "flex";
	//this.value this.name this.style this.id 이런거 속성쓰면안됨 다 -1뜸
	//ul에 잡아놓으면 -1뜸 정확히 li에 대한 핸들링을 해줘야됨!
	//console.log(this.node); //-1뜨는것은 잘못찍엇단 것!
	console.log(this.ea);
	
});
*/


document.addEventListener("DOMContentLoaded", function(){
	// 질문 모두 담김
	let ques = document.querySelectorAll(".faq_qe");
	
	ques.forEach((que, qindex)=>{
		
		let currentIndex = qindex;
		
		que.addEventListener("click",function(){
			let answers = document.querySelectorAll(".faq_an");
			
			answers.forEach((ans, aindex)=>{
				
				if(currentIndex == aindex){
					//해당하는 답변만 보여줄꺼
					ans.style.display = "block";
				}
				else{
					ans.style.display = "none";
				}
				
			});
			
		});
	})
	
});


