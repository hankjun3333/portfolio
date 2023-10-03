let menu_btn = document.querySelector("#menus");

menu_btn.addEventListener("click",function(e){
     let lis = document.querySelectorAll("#menus>li");
     var menu_node = [].indexOf.call(lis,e.target);
     var go_page="";
     switch(menu_node){
        case 0:
        go_page = "./main.html";
        break;
        case 1:
        go_page = "./product_main.html";
        break;
        case 2:
        go_page = "./delivery.html"; 
        break;
        case 3:
   
        break;
        case 4:
        go_page = "./config_main.html";    
        break;
     }
     location.href=go_page;
});