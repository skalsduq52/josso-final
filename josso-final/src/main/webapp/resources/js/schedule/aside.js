$(function(){
	$('.side_title1').click(function(){
        var submenu = $('.hover_tag1>li');
        if(submenu.is(":visible")){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
	$('.side_title2').click(function(){
		var submenu = $('.hover_tag2>li');
		if(submenu.is(":visible")){
			submenu.slideUp();
		}else{
			submenu.slideDown();
		}
	});
	$('.side_title3').click(function(){
		var submenu = $('.hover_tag3>li');
		if(submenu.is(":visible")){
			submenu.slideUp();
		}else{
			submenu.slideDown();
		}
	});
//	$('#inlineCheckbox3').click(function(){
//		if($('#inlineCheckbox3').prop('checked') == true){
//			$('#inlineCheckbox1').prop('checked', false);
//			$('#inlineCheckbox2').prop('checked', false);
//		}else{
//			$('#inlineCheckbox1').prop('checked', true);
//			$('#inlineCheckbox2').prop('checked', true);
//		}
//	});
//	$('.form-check-input').click(function(){
//		if($('#inlineCheckbox1').prop('checked')==false ||
//				$('#inlineCheckbox2').prop('checked')==false){
//			$('#inlineCheckbox3').prop('checked', false)
//		}else if($('#inlineCheckbox1').prop('checked')==true &&
//				$('#inlineCheckbox2').prop('checked')==true){
//		}
//	});
//	$('.form-check-input').click(function(){
//		if($('#inlineCheckbox1').prop('checked')==true){
//			$('#inlineCheckbox2').prop('checked', false);
//			$('#inlineCheckbox3').prop('checked', false);
//		}else if($('#inlineCheckbox2').prop('checked')==true){
//			$('#inlineCheckbox1').prop('checked', false);
//			$('#inlineCheckbox3').prop('checked', false);
//		}else if($('#inlineCheckbox3').prop('checked')==true){
//			$('#inlineCheckbox1').prop('checked', false);
//			$('#inlineCheckbox2').prop('checked', false);
//		}
//	});
	$('input[type="checkbox"][name="scheuleCheck"]').click(function(){
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="scheuleCheck"]').prop('checked',false);
			$(this).prop('checked',true);
		}
	});
});