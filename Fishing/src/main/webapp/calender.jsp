<%@ page import="java.util.List" %>
<%@ page import="model.EventBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calender staff</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="header.css" rel="stylesheet">
    <!---box icons--->   
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!---google fonts--->   
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <title>Calendar</title>
    <script type="text/javascript">
        const events = [
            <% 
                List<EventBean> eventList = (List<EventBean>) request.getAttribute("event");
                for (EventBean event : eventList) { 
            %>
                { 
                    date: new Date('<%= event.getEventDate() %>'), 
                    title: '<%= event.getEventName() %>',
                    id: '<%= event.getEventID() %>'
                },
            <% 
                }
            %>
        ];
    </script>
    
    <style>
        * {box-sizing: border-box;}
        ul {list-style-type: none;}
        body {font-family: Verdana, sans-serif; background-color: #f3f3f3;}
        
        .calendar-container {
            max-width: 800px;
            margin: auto;
            background: var(--text-color);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .month {
            padding: 20px;
            background: var(--other-color);
            text-align: center;
            color: var(--text-color);
            margin-bottom: 20px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .month span {
            font-size: 20px;
            text-transform: uppercase;
            letter-spacing: 3px;
            color: var(--text-color);
        }
        
        .weekdays {
            margin: 0;
            padding: 10px 0;
            background-color: var(--main-color);
            text-align: center;
            display: flex;
            border-radius: 5px;
            
        }
        
        .weekdays li {
            width: calc(100% / 7);
            color: #000000;
            padding: 10px 0;
            margin: 0;
            font-weight: bold;
        }
        
        .days {
            padding: 10px;
            background: var(--bg-color);
            margin: 0;
            text-align: center;
            display: flex;
            flex-wrap: wrap;
            list-style: none;
            border: 1px solid var(--main-color);
            border-radius: 5px;
            
        }
        
        .days li {
            width: calc(100% / 7);
            text-align: center;
            margin-bottom: 10px;
            font-size: 14px;
            color: var(--main-color);
            border: 1px solid var(--main-color);
            padding: 10px;
            position: relative;
            cursor: pointer;
            min-height: 80px;
        }
        
        .days li.event-day {
            background-color: #3498db;
            color: white;
        }
        
        .event {
            font-size: 12px;
            padding: 2px;
            margin-top: 5px;
            border-radius: 5px;
            background-color: #2c3e50;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }

        .event:hover {
            background-color: #34495e;
        }

        .days li.active {
            background-color: var(--main-color);
            color: var(--bg-color);
        }

        .navigation-buttons {
            text-align: center;
            margin: 20px 0;
        }

        .navigation-buttons button {
            background-color: var(--second-color);
            color: #000000;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin: 0 10px;
            font-size: 16px;
            border-radius: 5px;
        }

        .navigation-buttons button:hover {
            background-color: var(--main-color);
        }

        .month .prev, .month .next {
            cursor: pointer;
            padding: 10px;
            border-radius: 50%;
            background: var(--main-color);
            color: #000000;
            transition: background 0.3s;
        }

        .month .prev:hover, .month .next:hover {
            background: var(--other-color);
        }
    </style>
</head>
<body>

<!---header--->
<header>
    <a href="home.jsp" class="logo"><i class='bx bxs-home'></i>Kolam Mancing D'sentos</a>
    <ul class="navlist">
        <li><a href="home.jsp">HOME</a></li>
        <li class="dropdown">
            <a href="#booking" class="dropdown-toggle">ACCOUNT<span class="caret"></span></a>
            <ul class="dropdown-menu">
                <li><a href="listcustcontroller">CUSTOMER</a></li>
                <li><a href="liststaffcontroller">STAFF</a></li>
            </ul>
        </li>       
        <li><a href="listeventcontroller">EVENT</a></li>
        <li><a href="calendercontroller">SCHEDULE</a></li>
        
    </ul> 
    <div class="nav">
        <a href="viewstaff.jsp" class="btn">MY ACCOUNT<i class='bx bxs-user-circle'></i></a>
        <div class="bx bx-menu" id="menu-icon"></div>
    </div>  
</header>


<br><br><br><br><br>

<div class="calendar-container">
    <div class="month">      
        <div class="prev" onclick="prevMonth()">&#10094;</div>
        <div>
            <span id="month">August</span><br>
            <span id="year" style="font-size:18px">2024</span>
        </div>
        <div class="next" onclick="nextMonth()">&#10095;</div>
    </div>
    
    <div class="navigation-buttons">
        <button onclick="prevEvent()">Previous Event</button>
        <button onclick="nextEvent()">Next Event</button>
    </div>

    <ul class="weekdays">
        <li>Sun</li>
        <li>Mon</li>
        <li>Tue</li>
        <li>Wed</li>
        <li>Thu</li>
        <li>Fri</li>
        <li>Sat</li>
    </ul>

    <ul class="days" id="days">  
        <!-- Days will be added dynamically with JavaScript -->
    </ul>

    
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
const prevBtn = document.querySelector('.prev');
const nextBtn = document.querySelector('.next');
const monthText = document.getElementById('month');
const yearText = document.getElementById('year');
const daysList = document.getElementById('days');

let currentMonth = 7; 
let currentYear = 2024;

const monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October', 'November', 'December'
];

function generateCalendarDays(month, year) {
    daysList.innerHTML = '';

    const firstDay = new Date(year, month, 1).getDay();
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const offset = firstDay;

    for (let i = 0; i < offset; i++) {
        const li = document.createElement('li');
        daysList.appendChild(li);
    }

    for (let i = 1; i <= daysInMonth; i++) {
        const li = document.createElement('li');
        li.textContent = i;

        const event = events.find(event => event.date.getDate() === i && event.date.getMonth() === month && event.date.getFullYear() === year);
        if (event) {
            li.classList.add('event-day');
            const eventDiv = document.createElement('div');
            eventDiv.textContent = event.title;
            eventDiv.classList.add('event');
            eventDiv.onclick = () => viewEventDetails(event.id);

            li.appendChild(eventDiv);
        }

        daysList.appendChild(li);
    }

    const today = new Date();
    if (today.getMonth() === month && today.getFullYear() === year) {
        const todayDate = today.getDate();
        const activeDay = daysList.querySelector(`li:nth-child(${todayDate + offset})`);
        if (activeDay) {
            activeDay.classList.add('active');
        }
    }
}

generateCalendarDays(currentMonth, currentYear);

function prevMonth() {
    currentMonth--;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    }
    updateCalendar();
}

function nextMonth() {
    currentMonth++;
    if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    updateCalendar();
}

function updateCalendar() {
    monthText.textContent = monthNames[currentMonth];
    yearText.textContent = currentYear;
    generateCalendarDays(currentMonth, currentYear);
}

let currentEventIndex = -1;

function findNextEvent() {
    const today = new Date();
    for (let i = 0; i < events.length; i++) {
        if (events[i].date > today) {
            currentEventIndex = i;
            return events[i];
        }
    }
    return null;
}

function findPreviousEvent() {
    const today = new Date();
    for (let i = events.length - 1; i >= 0; i--) {
        if (events[i].date < today) {
            currentEventIndex = i;
            return events[i];
        }
    }
    return null;
}

function prevEvent() {
    if (currentEventIndex > 0) {
        currentEventIndex--;
        const event = events[currentEventIndex];
        currentMonth = event.date.getMonth();
        currentYear = event.date.getFullYear();
        updateCalendar();
    } else {
        alert("No previous events found.");
    }
}

function nextEvent() {
    if (currentEventIndex < events.length - 1) {
        currentEventIndex++;
        const event = events[currentEventIndex];
        currentMonth = event.date.getMonth();
        currentYear = event.date.getFullYear();
        updateCalendar();
    } else {
        alert("No next events found.");
    }
}

function viewEventDetails(eventID) {
	var url = 'vieweventcontroller?EventID=' + eventID; 
    window.location.href = url; 
}

document.addEventListener('DOMContentLoaded', () => {
    findNextEvent();
});
</script>

</body>
</html>
