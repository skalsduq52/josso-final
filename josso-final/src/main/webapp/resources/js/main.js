$(function(){
    $('.side_title').click(function(){
        // $('.hover_tag').slideToggle("slow,linear,callback");
        var submenu = $('.hover_tag>li');
        if(submenu.is(":visible")){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});