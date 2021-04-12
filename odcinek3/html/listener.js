$(function(){
	window.onload = (e) => {
        
		window.addEventListener('message', (event) => {
			var item = event.data;
			if (item !== undefined && item.type === "UI") {
				 $("#bottom-left-square").text = item.display;
				 alert(item.display);
				 $("#bottom-right-square").css("background-color", item.color); 
			}
		});
	};
});