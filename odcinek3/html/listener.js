$(function(){
	window.onload = (e) => {
        
		window.addEventListener('message', (event) => {
            alert(event.data);
			var item = event.data;
			if (item !== undefined && item.type === "UI") {
				 $("#top-left-square").text = item.display;
				 $("#bottom-right-square").css("background-color", item.color); 
			}
		});
	};
});