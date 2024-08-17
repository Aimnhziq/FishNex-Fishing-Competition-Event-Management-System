<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Catch</title>
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



<section id="customerTable">
	<div class="container">
		<h2>CATCH LIST</h2><br>
	<div class="containers">
	<table id="example" class="table table-striped">
	<thead>
		<tr>
			<th>CatchID</th>
            <th>CustID</th>
            <th>CustName</th>
			<th>CatchName</th>
			<th>CatchWeight</th>
			<th>CatchLength</th>
			<th>Action</th>
		</tr>
		</thead>
		<tbody >
		<c:forEach items="${catchs}" var="c" varStatus="catch">
		<tr>
			<td><c:out value="${c.catchID}"/></td>
			<td><c:out value="${c.custID}"/></td>
			<td><c:out value="${c.custName}"/></td>
			<td><c:out value="${c.catchName}"/></td>
			<td><c:out value="${c.catchWeight}"/></td>
			<td><c:out value="${c.catchLength}"/></td>
			<td>
				<button onclick="showCatchModal(${c.catchID})" class="btn-view btnla"><i class='bx bx-show'></i></button>
                <a href="updatecatchcontroller?CatchID=<c:out value='${c.catchID}'/>" class="btn-update btnla"><i class='bx bx-edit'></i></a>
				<button class="btn-delete btnla" id="<c:out value='${c.catchID}'/>" onclick="confirmation(this.id)"><i class='bx bx-trash'></i></button>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	</div>
</section>
	
<!-- Modal -->
<div class="modal fade" id="catchModal" tabindex="-1" aria-labelledby="catchModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="catchModalLabel">Catch Details</h5>
      </div>
      <div class="modal-body">
        <div id="catchDetails">
          <!-- Staff details will be loaded here -->
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!--- scroll top --->
<a href="#" class="scroll">
	<i class='bx bxs-up-arrow-square'></i>
</a>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
<script>
	$(document).ready(function () {
		$('#example').DataTable();
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

	const sr = ScrollReveal({
		origin: 'top',
		distance: '85px',
		duration: 2500,
		reset: true
	})

	sr.reveal ('.table-responsive',{delay:100});
	sr.reveal ('.contact-text',{delay:100});
	sr.reveal ('.scroll',{delay:100});
</script>

<style>
@charset "ISO-8859-1";

h2{
	text-align:center;
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



/* Custom styles for DataTable in catchList */
.containers{
	background:#ffffff;
	padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
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


/* Modal */
.modal-content {
     /* Light gray */
    border-radius: 15px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
    margin-top: 10%; /* Adjust as needed */

}

.modal-header {
    background-color: #343a40; /* Dark gray */
    color: #ffffff; /* White */
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
}

.modal-title {
    font-size: 1.5rem;
    font-weight: 600;
}

.modal-body {
    padding: 20px;
    margin-top:-120px;
    margin-left:27px;
}

.modal-footer {
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
    background-color: #343a40; /* Dark gray */
}

/* Close button */
.btn-close {
    color: #ffffff; /* White */
    opacity: 1;
}

.btn-close:hover {
    opacity: 0.8;
}

/* Customize buttons inside modal */
.btn-secondary {
    background-color: #6c757d; /* Grey */
    color: #fff;
    border-radius: 8px;
    padding: 8px 20px;
}

.btn-secondary:hover {
    background-color: #5a6268; /* Darker Grey */
}


/* Modal for Update Account */
#updateModal {
    background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
}

.update-modal-content {
    border-radius: 15px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
    margin-top: 50px;
    background: #ffffff; /* White background */
}

.update-modal-header {
    background-color: #343a40; /* Dark gray */
    color: #ffffff; /* White */
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    padding: 15px;
}

.update-modal-title {
    font-size: 1.5rem;
    font-weight: 600;
    margin: 0;
}

.update-modal-body {
    padding: 20px;
    margin-top: 20px;
    margin-left: 20px;
    color: #000000; /* Black */
}

.update-modal-footer {
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
    background-color: #343a40; /* Dark gray */
    padding: 15px;
}

.update-form-label {
    color: #000000; /* Black */
    font-weight: 500;
}

.update-form-input {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    color: #000000; /* Black */
}

.update-form-input:focus {
    outline: none;
    border-color: #007bff; /* Blue */
}

.update-form-submit {
    margin-top: 30px;
}




}
</style>
</body>
</html>