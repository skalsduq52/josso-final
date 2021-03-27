$(function(){
	$('.side_title').click(function(){
        var submenu = $('.hover_tag>li');
        if(submenu.is(":visible")){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});