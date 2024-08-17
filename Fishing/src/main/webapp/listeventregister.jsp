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
<link href="https://fonts.googleapis.com/css2?
family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- DataTables CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">

</head>
<!---header--->
<header>
	<a href="homecust.jsp" class="logo"><i class='bx bxs-home'></i>Kolam Mancing D'sentos</a>
	
	<ul class="navlist">
		<li><a href="homecust.jsp" >HOME</a></li>
		<li><a href="listeventcustcontroller">EVENT</a></li>
		<li><a href="calendercustcontroller">SCHEDULE</a></li>
	</ul>
	
	<div class="nav">
		<a href="viewcust.jsp" class="btn">MY ACCOUNT<i class='bx bxs-user-circle'></i></a>
		<div class="bx bx-menu" id="menu-icon"></div>
	</div>	
</header>

<body>
<div class="container">
  <h2>List Event </h2>
  <table id="eventTable" class="table table-striped">
    <thead>
      <tr>
        <th>Event Name</th>
        <th>Fee Price</th>
        <th>Event Detail</th>
        <th>Event Location</th>
        <th>Date</th>
        <th>Start Time</th>
        <th>End Time</th>
        <th>Actions</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${event}" var="c" varStatus="event">
        <tr>
          <td><c:out value="${c.eventName}"/></td>
          <td><c:out value="${c.eventFee}"/></td>
          <td><c:out value="${c.eventDetail}"/></td>
          <td><c:out value="${c.eventLocation}"/></td>
          <td><c:out value="${c.eventDate}"/></td>
          <td><c:out value="${c.startTime}"/></td>
          <td><c:out value="${c.endTime}"/></td>
          <td>
            <a href="registercontroller?EventID=<c:out value='${c.eventID}'/>" class="btn-view btnla">REGISTER</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
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
h2 {
  	text-align: center;
  	color: #000000;
    font-size: 24px; /* Adjust font size */
    padding: 10px 0; /* Add padding */
    margin-bottom: 20px; /* Add margin at the bottom for separation */
    text-transform: uppercase; /* Transform text to uppercase */
    letter-spacing: 1px; /* Add letter spacing for readability */
    font-weight: 600; /* Increase font weight for emphasis */
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
.container {
  margin-top: 50px;
  background-color:var(--second-color);
  margin-top:150px;
  border-radius: 10px;
}

/*button*/
/* Styles for the buttons */
.btnla {
    display: inline-block;
    padding: 8px 16px;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    cursor: pointer;
    font-size: 14px;
    transition: background-color 0.3s;
}

/* Styles for the View button */
.btn-view {
    background-color: #6c757d; /* Grey */
    color: #fff;
}

.btn-view:hover {
    background-color: #5a6268; /* Darker Grey */
}
/* Other styles as needed */
</style>
</body>
</html>
