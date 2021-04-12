$(function(){
	window.onload = (e) => {
        
		window.addEventListener('message', (event) => {
            
			var item = event.data;
			if (item !== undefined && item.type === "UI") {
             
				 $("#top-left-square").text = display;
				 $("#bottom-right-square").css("background-color", color); 
			}
		});
	};
});