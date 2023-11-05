    
    var useform = document.getElementById("useform");
    function use_no(val,midx){
    	document.getElementById("muse").value= val;
    	document.getElementById("midx").value= midx;
    	if(confirm("정말 정지하시겠습니까?")){
    	useform.submit();
    	}
    }
    function use_yes(val,midx){
    	document.getElementById("muse").value= val;
    	document.getElementById("midx").value= midx;
    	if(confirm("정말 해제 하시겠습니까?")){
    	useform.submit();
    	}
    }    
