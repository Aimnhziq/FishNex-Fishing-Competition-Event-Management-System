<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>List Event</title>
<!---box icons--->    
<link rel="stylesheet"
href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" 
rel="stylesheet">
<link href="header.css" rel="stylesheet">

<!---google fonts--->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- DataTables CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

</head>
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

<body>
<div class="container">
  <h2>List Event </h2>
  <div class="add-event-container">
    <a href="addevent.jsp" class="btn-add-event btnla"><i class='bx bx-plus'></i>ADD EVENT</a>
      <div class="bx bx-menu" id="menu-icon"></div>
  </div>
  <br><br>
  <div class="containers">
  <table id="eventTable" class="table table-striped">
    <thead>
      <tr>
        <th>Image</th>
        <th>Event Name</th>
        <th>Fee Price</th>
        <th>Event Location</th>
        <th>Date</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>Participants number</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${event}" var="c" varStatus="event">
        <tr>
          <td><img src="${c.eventPictureBase64}" alt="Event Image" style="width: 120px; height: 150px; object-fit: cover;"></td>
          <td><c:out value="${c.eventName}"/></td>
          <td><c:out value="${c.eventFee}"/></td>
          <td><c:out value="${c.eventLocation}"/></td>
          <td><c:out value="${c.eventDate}"/></td>
          <td><c:out value="${c.startTime}"/></td>
          <td><c:out value="${c.endTime}"/></td>
          <td><c:out value="${registrationCounts[c.eventID]}"/> / 20</td>
          <td>
            <a href="vieweventcontroller?EventID=<c:out value='${c.eventID}'/>" class="btn-view btnla"><i class='bx bx-show'></i></a><br><br>
            <a href="updateeventcontroller?EventID=<c:out value='${c.eventID}'/>" class="btn-update btnla"><i class='bx bx-edit'></i></a><br><br>
            <button class="btn-delete btnla" id="<c:out value='${c.eventID}'/>" onclick="confirmation(this.id)"><i class='bx bx-trash'></i></button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</div>

<!-- DataTables JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

<script>
$(document).ready(function() {
    $('#eventTable').DataTable();
});

function confirmation(eventID) {
    console.log(eventID);
    var r = confirm("Are you sure you want to delete?");
    if (r == true) {
        location.href = 'deleteeventcontroller?EventID=' + eventID;
        alert("Event Detail successfully deleted");
    } else {
        return false;
    }
}

// DROPDOWN
document.addEventListener("DOMContentLoaded", function() {
    var dropdownToggle = document.querySelectorAll(".dropdown-toggle");

    dropdownToggle.forEach(function(toggle) {
        toggle.addEventListener("click", function(e) {
            e.preventDefault();
            var dropdownMenu = this.nextElementSibling;
            dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
        });
    });
});

const header = document.querySelector("header");

window.addEventListener("scroll", function(){
    header.classList.toggle("sticky", window.scrollY > 80);
});

let menu = document.querySelector('#menu-icon');
let navlist = document.querySelector('.navlist');

menu.onclick = () => {
    menu.classList.toggle('bx-x');
    navlist.classList.toggle('open');
}

window.onscroll = () => {
    menu.classList.remove('bx-x');
    navlist.classList.remove('open');
}
</script>

<style>
h2{
	text-align:center;
}

.table {
    margin-top: 20px;
}

.btn-sm {
    padding: 0.25em 0.5em;
    font-size: 0.875rem;
    border-radius: 0.2rem;
}

.nav .btn {
    margin-left: 5px;
}

/*CUSTOMER LIST*/
/*TABLE*/
.dataTables_wrapper .dataTables_paginate .paginate_button {
    padding: 0;
    margin-left: -2px;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
    background: none;
    border: none;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.current,
.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
    background: var(--other-color);
    border: none;
    color: white !important;
    border-radius: 50%;
}

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled {
    background: none;
    border: none;
}

.dataTables_wrapper .dataTables_paginate .paginate_button:disabled {
    color: #d3d3d3 !important;
}

.dataTables_wrapper .dataTables_length select,
.dataTables_wrapper .dataTables_filter input {
    color: var(--other-color);
    border: 1px solid var(--other-color);
    border-radius: 4px;
    padding: 5px;
    margin: 0 5px;
}

.dataTables_wrapper .dataTables_length select:focus,
.dataTables_wrapper .dataTables_filter input:focus {
    outline: none;
    border-color: var(--main-color);
}

.dataTables_wrapper .dataTables_info {
    margin-top: 10px;
    color: var(--other-color);
}

.dataTables_wrapper .dataTables_filter input {
    width: auto;
    display: inline-block;
}

.dataTables_wrapper .dataTables_filter label {
    color: var(--other-color);
}

.dataTables_wrapper .dataTables_length label {
    color: var(--other-color);
}

.dataTables_wrapper .dataTables_length select {
    display: inline-block;
    width: auto;
}

.table th,
.table td {
    padding: 10px;
    border: 1px solid #ccc;
    text-align: left;
}

.table th {
    background-color: var(--other-color);
    color: var(--text-color);
}

.table td {
    background-color: #f9f9f9;
    color: var(--other-color);
}

/* Additional styling for table headers and rows */
.table thead th {
    background-color: var(--other-color);
    color: var(--text-color);
    font-weight: bold;
    text-align: center;
}

.table tbody tr:hover {
    background-color: #f1f1f1;
}

.table tbody tr:nth-child(even) {
    background-color: #e9e9e9;
}

/* Responsive table */
@media (max-width: 768px) {
    .dataTables_wrapper .dataTables_filter {
        text-align: left;
    }

    .dataTables_wrapper .dataTables_length {
        text-align: left;
    }

    .dataTables_wrapper .dataTables_paginate {
        text-align: left;
        margin-top: 10px;
    }
}

.container {
  color: var(--text-color);
  margin: 50px auto;
  margin-top: 100px;
  padding: 20px;
  background: linear-gradient(90deg, var(--other-color), var(--other-color));
  border-radius: 50px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border: 1px solid #ccc;
}

/* General button styles */
.btnla {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s, box-shadow 0.3s;
}


/* Styles for the ADD EVENT button */
.btn-add-event {
    background-color: #ffffff; /* White */
    color: #000; /* Black text */
    font-weight: bold;
    border: 2px solid #f8f9fa; /* Green border */
    border-radius: 50px;
}

.btn-add-event:hover {
    background-color: #f8f9fa; /* Light grey */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
}

/* Icon styles */
.btnla i {
    margin-right: 8px; /* Space between icon and text */
    font-size: 16px; /* Adjust icon size */
}

/* Responsive design for smaller screens */
@media (max-width: 768px) {
    .btnla {
        font-size: 12px; /* Smaller font size for buttons */
        padding: 6px 12px; /* Less padding for buttons */
    }

    .btnla i {
        margin-right: 6px; /* Smaller space between icon and text */
        font-size: 14px; /* Smaller icon size */
    }
}

/* Specific styles for the container holding the ADD EVENT button */
.add-event-container {
    text-align: Right; /* Center the button */
    margin-right:30px;
    margin-bottom: 0px; /* Space below the button */
    border-radius: 50px;
}
/* Styles for the View button */
.btn-view {
    background-color: #6c757d; /* Grey */
    color: #fff;
}

.btn-view:hover {
    background-color: #5a6268; /* Darker Grey */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
}

/* Styles for the Update button */
.btn-update {
    background-color: #007bff; /* Blue */
    color: #fff;
}

.btn-update:hover {
    background-color: #0056b3; /* Darker Blue */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
}

/* Styles for the Delete button */
.btn-delete {
    background-color: #dc3545; /* Red */
    color: #fff;
}

.btn-delete:hover {
    background-color: #c82333; /* Darker Red */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
}

/* Icon styles */
.btnla i {
    margin-right: 8px; /* Space between icon and text */
    font-size: 16px; /* Adjust icon size */
}

/* Responsive design for smaller screens */
@media (max-width: 768px) {
    .btnla {
        font-size: 12px; /* Smaller font size for buttons */
        padding: 6px 12px; /* Less padding for buttons */
    }

    .btnla i {
        margin-right: 6px; /* Smaller space between icon and text */
        font-size: 14px; /* Smaller icon size */
    }
}

/* Styles for the Add Event button */
.add-event-btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    cursor: pointer;
    font-size: 14px;
    background-color: #28a745; /* Green */
    color: #fff;
    transition: background-color 0.3s, box-shadow 0.3s;
    margin-bottom: 20px;
}

.add-event-btn:hover {
    background-color: #218838; /* Darker Green */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* Add shadow on hover */
}

/* Icon styles for Add Event button */
.add-event-btn i {
    margin-right: 8px; /* Space between icon and text */
    font-size: 16px; /* Adjust icon size */
}

/* Responsive design for smaller screens */
@media (max-width: 768px) {
    .add-event-btn {
        font-size: 12px; /* Smaller font size for buttons */
        padding: 6px 12px; /* Less padding for buttons */
    }

    .add-event-btn i {
        margin-right: 6px; /* Smaller space between icon and text */
        font-size: 14px; /* Smaller icon size */
    }
}
.containers{
	background:#ffffff;
	padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}
/* Other styles as needed */
</style>
</body>
</html>
