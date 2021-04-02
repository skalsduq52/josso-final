$(function() {
	$('.hover_team1').click(function() {
		var submenu = $('.modal_mb1');
		var department = $('.hover_team1>a>b').text();
		console.log(department);
		if (submenu.is(":visible")) {
			submenu.slideUp();
//			닫힐 떄
		} else {
			submenu.slideDown();
//			$.ajax({
//				url: '/josso/attendeeList',
//				type: 'POST',
//			    data: {
//			    	department
//				},
//				success: function(result) {
//					console.log(result);
//				},
//				error : function(request, status, errorData){
//					alert("error code : "+request.status + "\n"
//						+ "message : "+request.responseText + "\n"
//						+ "error : "+errorData);
//				}
//			});
//			열릴 때
		}
		
	});
	$('.hover_team2').click(function() {
		var submenu = $('.modal_mb2');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.hover_team3').click(function() {
		var submenu = $('.modal_mb3');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.hover_team4').click(function() {
		var submenu = $('.modal_mb4');
		if (submenu.is(":visible")) {
			submenu.slideUp();
		} else {
			submenu.slideDown();
		}
	});
	$('.btn_wrap').click(function() {
		var modalDiv = $('#exampleModal');
		modalDiv.modal({
			backdrop : false,
			show : true
		});
//		$('.modal-dialog').draggable({
//			handle : ".modal-header"
//		});
	});
	$('.btn-danger').click(function(){
		var scheduleNum = $('.btn-danger').val();
		location.href = '/josso/schedule/delete?scheduleNum='+scheduleNum;
	});
});
//$(function() {
//	$('.start_date').datepicker({
//		format : "yyyy-mm-dd"
//	});
//	$('.end_date').datepicker({
//		format : "yyyy-mm-dd"
//	});
//});