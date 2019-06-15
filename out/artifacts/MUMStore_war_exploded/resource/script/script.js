$(window).scroll(function(){
    $("#theFixed").css("top",Math.max(0,850-$(this).scrollTop()));
});