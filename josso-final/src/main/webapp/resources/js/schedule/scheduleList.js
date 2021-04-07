$(function(){
	if($('.form-check-input').is(":checked")==true){
		var selectList = $('.form-check-input').val();
		console.log(selectList);
		var calendarEl = document.getElementById('calendar');
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	        
	    },
	    locale: 'ko',
	    editable: true,
	    eventSources: [{
	    	events: function(info, successCallback, failureCallback){
	    		$.ajax({
					url: '/josso/scheduleListAll',
					contentType:'application/json; charset=UTF-8',
					type: 'POST',
					dataType: 'json',
					success: function(data) {
						successCallback(data);
					}
				});
	    	}
	    }],
	    eventClick: function(info){
	    	var eventObj = info.event;
	    	console.log(eventObj.id);
	    	
	    	location.href = 'schedule/detail?id='+eventObj.id;
	    }
	    });
	    calendar.render();
	}
	$('.form-check-input').click(function(){
		var checkList = Array();
		var selectList = $('.form-check-input');
		var checkList2 = Array();
		for(i=0; i<selectList.length; i++){
			if(selectList[i].checked == true){
				checkList[i] = selectList[i].value;
				console.log("for문 : "+checkList[i]);
				
			}
		}
		// null 빼는 거
		checkList2 = checkList.filter(function (el){
			return el != null;
		});
		console.log("넌 뭐야?"+checkList2);
		var calendarEl = document.getElementById('calendar');
		
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    },
	    locale: 'ko',
	    editable: true,
	    eventSources: [{
	    	events: function(info, successCallback, failureCallback){
	    		$.ajax({
					url: '/josso/scheduleListAll2',
					contentType:'application/json; charset=UTF-8',
					type: 'POST',
					dataType: 'json',
					data: JSON.stringify(checkList2),
					success: function(data) {
						successCallback(data);
					}
				});
	    	}
	    }],
	    eventClick: function(info){
	    	var eventObj = info.event;
	    	console.log(eventObj.id);
	    	
	    	location.href = 'schedule/detail?id='+eventObj.id;
	    }
	    });
	    calendar.render();
	});
});