$(function(){
	window.onload = (e) => {
        
		window.addEventListener('message', (event) => {
			var item = event.data;
			if (item !== undefined && item.type === "UI") {
				 $("#-left-square").text = item.display;
				 $("#bottom-right-square").css("background-color", item.color); 
			}
		});
	};
});