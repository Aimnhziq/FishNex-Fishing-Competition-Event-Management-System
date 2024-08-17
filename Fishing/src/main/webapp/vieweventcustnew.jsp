<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Event Details and Leaderboard</title>
<!---box icons--->    
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
<link href="header.css" rel="stylesheet">

<!---google fonts--->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>

</head>

<body>
<br><br>

    <div id="eventDetails" class="tab-content active" >
    <div class="event-details-container">
        <h3>Event Details</h3>
        <div class="event-info">
            <div class="event-desc-container">
                <div class="event-desc">
                    <h3>Event Name: <c:out value='${c.eventName}'/></h3>
                    <p><strong>Event ID:</strong> <c:out value='${c.eventID}'/></p>
                    <p><strong>Fee:</strong> <c:out value='${c.eventFee}'/></p>
                    <p><strong>Details:</strong> <c:out value='${c.eventDetail}'/></p>
                    <p><strong>Location:</strong> <c:out value='${c.eventLocation}'/></p>
                    <p><strong>Date:</strong> <c:out value='${c.eventDate}'/></p>
                    <p><strong>Start Time:</strong> <c:out value='${c.startTime}'/></p>
                    <p><strong>End Time:</strong> <c:out value='${c.endTime}'/></p>
                </div>
                
                <div class="button-container">
                <a href="registerevent.jsp?EventID=<c:out value='${c.eventID}'/>" class="button-container view">REGISTER</a>
                </div>
            </div>
            <div class="event-img-container">
                <div class="event-img">
                    <img src="${c.eventPictureBase64}" alt="Event Image" style="width: 100%; height: 100%; object-fit: cover;">
                </div>
            </div>
        </div>
    </div>
</div>


   

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
	$(document).ready(function () {
	    $('#example').DataTable({
	        "paging": true,
	        "lengthChange": true,
	        "searching": true,
	        "ordering": true,
	        "info": true,
	        "autoWidth": false,
	        "responsive": true
	    });
	});
	
	
	function showCatchModal(catchID) {
        $.ajax({
          url: "viewcatchcontroller?CatchID=" + catchID,
          success: function(response) {
            $('#catchDetails').html(response);
            $('#catchModal').modal('show');
          }
        });
      }
    
 // Make the close icon functional
    document.addEventListener('DOMContentLoaded', function () {
	    var closeButtons = document.querySelectorAll('.btn-close');
	    closeButtons.forEach(function (btn) {
	        btn.addEventListener('click', function () {
	            var modal = document.querySelector(this.getAttribute('data-bs-target'));
	            if (modal) {
	                modal.classList.remove('show');
	            }
	        });
	    });
	});
 
 
    function openUpdateModal(catchID, custID, catchName, catchWeight, catchLength) {
        $('#CatchID').val(catchID);
        $('#CustID').val(custID);
        $('#CatchName').val(catchName);
        $('#CatchWeight').val(catchWeight);
        $('#CatchLength').val(catchLength);
        $('#updateModal').modal('show');
    } 

	function confirmation(catchID) {
		console.log(catchID);
		var r = confirm("Are you sure you want to delete?");
		if (r == true) {
			location.href = 'deletecatchcontroller?CatchID=' + catchID;
			alert("Catch Detail successfully deleted");
		} else {
			return false;
		}
	}



/* DROPDOWN */

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

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 50px;
    background: var(--second-color);
    margin-top: 60px;
    text-align: center;
    color:#000000;
}

.event-details-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}


h2 {
    text-align: center;
    font-size: 30px;
    color: var(--text-color);
    background: var(--other-color);
    padding: 10px;
    box-shadow: 0px 1px 25px #98c1d9;
    border-radius: 10px;
    margin-top: 140px;
    width: 350px;
    margin-left: auto;
    margin-right: auto;
}

h3 {
    color: #000000;
    font-size: 24px; /* Adjust font size */
    padding: 10px 0; /* Add padding */
    margin-bottom: 20px; /* Add margin at the bottom for separation */
    text-transform: uppercase; /* Transform text to uppercase */
    letter-spacing: 1px; /* Add letter spacing for readability */
    font-weight: 600; /* Increase font weight for emphasis */
}

.event-info {
    display: flex; /* Use flexbox layout */
}

.event-img-container {
    flex: 0 0 400px; /* Set a fixed width for the image container */
    margin-left: 20px; /* Add some space between the description and image container */
    border: 1px solid #ccc; /* Add border to the image container */
    border-radius: 10px; /* Add border radius to the image container */
    overflow: hidden; /* Ensure the image fits within the container */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add some shadow to the image container */
}

.event-img {
    width: 100%; /* Ensure the image container takes the full width */
    height: 450px; /* Set a fixed height for the image container */
    overflow: hidden; /* Ensure the image fits within the container */
}

.event-desc-container {
    flex: 1; /* Allow the description container to take remaining space */
}

.event-desc {
    background-color: #f0f0f0; /* Change background color */
    border: 1px solid #ccc; /* Add border */
    border-radius: 10px; /* Add border radius */
    padding: 20px; /* Add padding */
}

.event-desc h3, .event-desc p {
    text-align: left; /* Align text to the left */
    margin: 0; /* Remove default margins */
}

.event-desc p {
    margin-bottom: 10px; /* Add some space between paragraphs */
}


.tab-container {
    display: flex;
    justify-content: center;
    margin-bottom: 20px;
}

.tab {
    padding: 10px 20px;
    cursor: pointer;
    background: #fff;
    margin: 0 10px;
    border-radius: 10px;
    font-weight: bold;
    color: var(--other-color);
    text-decoration:none;
}

.tab.active {
    background: var(--other-color);
    color: var(--text-color);
}

.tab-content {
    display: none;
    /* Example: Add transition effect when switching tabs */
    transition: opacity 0.5s ease;

}

.tab-content.active {
    display: block;
}


/*button at event detail*/
.button-container a,
.button-container button {
    padding: 10px 20px;
    margin: 0 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    text-decoration: none;
}

.button-container .view {
    background-color: var(--main-color);
    color: var(--other-color);
}

.button-container .view:hover {
    background-color: #000000;
    color: var(--text-color);
}

.button-container .delete {
    background-color: #ff4136;
    color: #000000;
}

.button-container .delete:hover {
    background-color: white;
    color: #ff4136;
}

.button-container .update {
    background-color: #ff851b;
    color: #000000;
}

.button-container .update:hover {
    background-color: white;
    color: #ff851b;
}

/* Custom styles for DataTable in catchList */
.containers{
	background:#ffffff;
	padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}


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




</style>
</body>
</html>
