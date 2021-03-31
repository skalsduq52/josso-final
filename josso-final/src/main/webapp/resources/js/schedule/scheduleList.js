$(function(){
//	function getEvent(){
//		var events;
//		
//		
//		return events;
//	}
	var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
    	headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
        
    },
    defaultView: 'timeGridWeek',
    locale: 'ko',
    editable: true,
    allDaySlot: false,
    eventSources: [{
    	events: function(info, successCallback, failureCallback){
    		$.ajax({
				url: '/josso/schedule"/',
				contentType:'application/json; charset=UTF-8',
				traditional:true,
				type: 'GET',
				dataType: 'json',
				data: JSON.stringify(fransList),
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