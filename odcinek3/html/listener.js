$(function(){
	window.onload = (e) => {
        
		window.addEventListener('message', (event) => {
			var item = event.data;
			alert(event.data.type);
			if (item !== undefined && item.type === "UI") {
				alert(event.data.display);
				alert(event.data.color);
				 $("#top-left-square").text = item.display;
				 $("#bottom-right-square").css("background-color", item.color); 
			}
		});
	};
});