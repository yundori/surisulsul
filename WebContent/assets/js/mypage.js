   $(document).ready(function() {
        $(".tab-button-item-link").click(function(e) {
            e.preventDefault();
            $(".tab-button-item-link").not(this).removeClass("selected");
            $(this).addClass("selected");
            var target = $(this).attr('href');
            $(target).removeClass('hide');
            $(".tab-panel>div").not($(target)).addClass('hide');
        });
    });