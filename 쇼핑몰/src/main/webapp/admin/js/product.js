document.querySelector("#f").addEventListener("submit",function(e){
	e.preventDefault();
		if(f.search.value==""){
			location.href='./admin_product.do';
		}else{
			f.submit();
		}
	});



function paging(z){
	location.href="./admin_product.do?page="+z;
} 

function getSelectedPidx() {
    var selectedPidx = [];
    var checkboxes = document.querySelectorAll('input[name="pidx"]:checked');
    for (var i = 0; i < checkboxes.length; i++) {
        var parentUl = checkboxes[i].closest('ul');
        var hiddenInput = parentUl.querySelector('input[type="hidden"][name="pidx"]');
        if (hiddenInput) {
            selectedPidx.push(hiddenInput.value);
        }
    }
    return selectedPidx;
}

 
function pd_delete() {
    var selectedPidx = getSelectedPidx();
    if (selectedPidx.length == 0) {
        alert('삭제할 상품을 선택하세요.');
        return;
    }
    
    if (confirm(selectedPidx.length +'개의 상품을 정말 삭제하시겠습니까? 복구가 불가능합니다.')) {
		var jsonData = JSON.stringify(selectedPidx);
		
		var http= new XMLHttpRequest();
		http.onreadystatechange = function(){
			if(http.readyState == XMLHttpRequest.DONE){
				if(http.status==200){
					var result = this.response;
					if(result =="ok"){
						alert('정상적으로 삭제되었습니다.');
						location.href="./admin_product.do";
					}
					else{
						alert("삭제오류");
					}
				}
				else{
					console.log("상태에러 : " + http.status);
				}
			}
		}
		http.open("POST","./deleteok",true);
		http.setRequestHeader("Content-Type","application/json");
    	http.send(jsonData);
    }
}

function pd_write(){
	location.href="./admin_product_write.jsp";
}