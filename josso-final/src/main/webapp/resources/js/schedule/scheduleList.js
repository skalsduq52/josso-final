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
        
    }]
    });
    calendar.render();
});