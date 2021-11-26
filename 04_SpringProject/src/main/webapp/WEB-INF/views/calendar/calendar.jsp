<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='${pageContext.request.contextPath }/resources/css/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath }/resources/js/main.js'></script>

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩관련 라이브러리 -->

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: '2021-11-01',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('Event Title:');
        if (title) {
          calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
          }) 
        }
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('Are you sure you want to delete this event?')) {
          arg.event.remove()
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: [
        {
          title: 'All Day Event',
          start: '2021-11-01'
        },
        {
          title: 'Long Event',
          start: '2021-11-05',
          end: '2021-11-10'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-11-17T16:00:00'
        },
        {
          groupId: 999,
          title: 'Repeating Event',
          start: '2021-11-20T16:00:00'
        },
        {
          title: 'Conference',
          start: '2021-11-12',
          end: '2021-11-13'
        },
        {
          title: 'Meeting',
          start: '2021-11-24T10:30:00',
          end: '2020-11-25T12:30:00'
        },
        {
          title: 'Lunch',
          start: '2020-11-08T12:00:00'
        },
        {
          title: 'Meeting',
          start: '2020-11-08T14:30:00'
        },
        {
          title: 'Happy Hour',
          start: '2020-11-11T17:30:00'
        },
        {
          title: 'Dinner',
          start: '2020-11-19T20:00:00'
        },
        {
          title: 'Birthday Party',
          start: '2020-11-29T07:00:00'
        },
        {
          title: 'Click for Google',
          url: 'http://google.com/',
          start: '2021-11-01'
        }
      ]
    });

    calendar.render();
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>
