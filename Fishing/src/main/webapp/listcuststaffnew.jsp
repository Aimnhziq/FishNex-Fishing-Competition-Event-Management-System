<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer List</title>
    <!-- Box icons -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="header.css" rel="stylesheet">

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
</head>

<body>
<br><br>



<div class="containers">
    <h3>Participants List</h3>
    <table border="1" id="custList" class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>Event ID</th>
                <th>Participants ID</th>
                <th>Participants Name</th>
                <th>Participants Receipt</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="eventdetail" items="${eventdetails}">
                <tr>
                	<td><c:out value="${eventdetail.eventID}" /></td>
                    <td><c:out value="${eventdetail.custID}" /></td>
                    <td><c:out value="${eventdetail.custName}" /></td>
                    <td><c:out value="${eventdetail.custReceipt}" /></td>
                    <td>
                        <a href="addcatchlistcontroller?CustID=<c:out value='${eventdetail.custID}'/>&EventID=<c:out value='${eventdetail.eventID}'/>" class="btn-update btnla">Add catch</a>
                        <button class="btn-delete btnla" id="<c:out value='${eventdetail.custID}'/>" onclick="confirmation(this.id, 'customer')"><i class='bx bx-trash'></i></button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
		$(document).ready(function () {
		    $('#custList').DataTable({
		        "paging": true,
		        "lengthChange": true,
		        "searching": true,
		        "ordering": true,
		        "info": true,
		        "autoWidth": false,
		        "responsive": true
		    });
		});

		function confirmation(custID) {
	        console.log(custID);
	        var r = confirm("Are you sure you want to delete?");
	        if (r == true) {
	            location.href = 'deletecustomercontroller?custID=' + custID;
	            alert("Customer detail successfully deleted");
	        } else {
	            return false;
	        }
	    }		

function showCustomerModal(custID) {
    $.ajax({
      url: "viewcustomercontroller?custID=" + custID,
      success: function(response) {
        $('#customerDetails').html(response);
        $('#customerModal').modal('show');
      }
    });
}

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

function openUpdateModal(custID, eventID, eventName, custName, custReceipt) {
    $('#CustID').val(custID);
    $('#EventID').val(eventID);
    $('#EventName').val(eventName);
    $('#CustName').val(custName);
    $('#CustReceipt').val(custReceipt);
    $('#updateModal').modal('show');
} 

function confirmation(id, type) {
    var r = confirm("Are you sure you want to delete?");
    if (r == true) {
        var url = 'deletecatchcontroller?';
        if (type === 'catch') {
            url += 'CatchID=' + id;
        } else if (type === 'customer') {
            url += 'CustID=' + id;
        }
        location.href = url;
        alert("Successfully deleted");
    } else {
        return false;
    }
}

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

.event-img {
    flex: 0 0 200px; /* Set a fixed width for the image */
    margin-right: 20px; /* Add some space between the image and text */
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

.containers {
    background: #ffffff;
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

/* Styles for the Update button */
.btn-update {
    background-color: #6c757d; /* Grey */
    color: #fff;
}

.btn-update:hover {
    background-color: #5a6268; /* Darker Grey */
}

/* Styles for the Delete button */
.btn-delete {
    background-color: #dc3545; /* Red */
    color: #fff;
}

.btn-delete:hover {
    background-color: #c82333; /* Darker Red */
}
</style>
</body>
</html>
