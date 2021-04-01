$(function(){
//	function getEvent(){
//		var events;
//		
//		
//		return events;
//	}
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
					console.log(data);
				}
			});
    	}
    }],
    eventClick: function(info){
    	var eventObj = info.event;
    	console.log(eventObj.id);
    	
    	location.href = 'schedule/detail?id='+eventObj.id;
    	/*$.ajax({
    		url: '/josso/schedule/detail',
    		type: 'GET',
    		data:{
    			'id' : eventObj.id
    		}
//    		success: function(data){
//    			location.href = 'scheduleDetail'
//    		}
    	});
    	*/
    }
    });
    calendar.render();
});