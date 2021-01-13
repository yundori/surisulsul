$(document).ready(function() { 
	// icon_box에 마우스오버 시 icon_description 보이게
	 $(".juneung_icon").hover(
	     function() {
	         $(this).parent().find(".icon_description").toggleClass("text_visible");
	     }
	 );
})