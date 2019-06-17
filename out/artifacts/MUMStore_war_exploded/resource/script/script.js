(function(){
    "use strict";

    $(function () {
        $("#theFixed").css("top", Math.max(0, 600 - $(this).scrollTop()));
        $(window).scroll(function() {
            $("#theFixed").css("top", Math.max(0, 600 - $(this).scrollTop()));
        });
    });
})();

