$(document).ready(function() { 
	$(".icons").hover(
        function() {
            //console.log("hover 들어옴");
            $(this).parent().find(".icon_description").toggleClass("text_visible");
        }
    );
})