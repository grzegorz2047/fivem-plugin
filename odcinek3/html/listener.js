$(function(){
	window.onload = (e) => {
        
		window.addEventListener('message', (event) => {
			var item = event.data;
			if (item !== undefined && item.type === "speedometr") {
				 $("#bottom-left-square").text(item.display);
				 $("#top-right-square").css("background-color", item.color); 
			}
		});
	};
});