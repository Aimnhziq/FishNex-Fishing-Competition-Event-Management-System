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
    



 <section id="customerTable">
        <div class="container">
            <div class="add-catch-wrapper">
                <a href="addcatch.jsp" class="btn-add-catch"><i class='bx bx-plus'></i>Add Catch</a>
            </div>
            <br><br>
            <table id="example" class="table table-striped">
                <thead>
                    <tr>
                        <th>CatchID</th>
                        <th>CustID</th>
                        <th>CatchName</th>
                        <th>CatchWeight</th>
                        <th>CatchLength</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${catchs}" var="c" varStatus="catch">
                        <tr>
                            <td><c:out value="${c.catchID}" /></td>
                            <td><c:out value="${c.custID}" /></td>
                            <td><c:out value="${c.catchName}" /></td>
                            <td><c:out value="${c.catchWeight}" /></td>
                            <td><c:out value="${c.catchLength}" /></td>
                            <td>
                                <button onclick="showCatchModal(${c.catchID})" class="btn-view btnla"><i class='bx bx-show'></i></button>
                                <button onclick="openUpdateModal(${c.catchID}, '${c.custID}', '${c.catchName}', '${c.catchWeight}', '${c.catchLength}')" class="btn-update btnla"><i class='bx bx-edit'></i></button>
                                <button class="btn-delete btnla" id="<c:out value='${c.catchID}' />" onclick="confirmation(this.id)"><i class='bx bx-trash'></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
                        <!-- catch details will be loaded here -->
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for Update Account -->
    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content update-modal-content">
                <div class="modal-header update-modal-header">
                    <h5 class="modal-title update-modal-title" id="updateModalLabel">Update Catch Detail</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body update-modal-body">
                    <!-- Update account form -->
                    <form action="updatecatchcontroller" method="post">
                        <input type="hidden" id="CatchID" name="CatchID" value="<c:out value='${c.catchID}' />" required>
                        <div class="mb-3">
                            <label for="CustID" class="form-label update-form-label">Participants ID</label>
                            <input type="number" class="form-control update-form-input" id="CustID" name="CustID">
                        </div>
                        <div class="mb-3">
                            <label for="CatchName" class="form-label update-form-label">Catch Name</label>
                            <input type="text" class="form-control update-form-input" id="CatchName" name="CatchName">
                        </div>
                        <div class="mb-3">
                            <label for="CatchWeight" class="form-label update-form-label">Catch Weight</label>
                            <input type="text" class="form-control update-form-input" id="CatchWeight" name="CatchWeight">
                        </div>
                        <div class="mb-3">
                            <label for="CatchLength" class="form-label update-form-label">Catch Length</label>
                            <input type="text" class="form-control update-form-input" id="CatchLength" name="CatchLength">
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
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

 /* Add Catch button wrapper */
    .add-catch-wrapper {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }

    /* Add Catch button */
    .btn-add-catch {
        padding: 12px 24px;
        border: none;
        border-radius: 30px;
        background: linear-gradient(to right, #00bfff, #1e90ff);
        color: #fff;
        font-size: 16px;
        font-weight: bold;
        text-transform: uppercase;
        text-decoration: none;
        cursor: pointer;
        transition: background 0.3s, transform 0.3s;
    }

    .btn-add-catch:hover {
        background: linear-gradient(to right, #1e90ff, #00bfff);
        transform: scale(1.05);
    }

    /* Table */
    .table-responsive {
        width: 100%;
        margin-top: 20px;
    }

    .table-responsive h2 {
        text-align: center;
        font-size: 24px;
        color: #000000;
        background: linear-gradient(90deg, #71797E, #C0C0C0);
        padding: 8px 15px;
        box-shadow: 0px 1px 20px black;
        border-radius: 20px;
        margin-top: 0;
    }

    .table {
        width: 100%;
        margin-bottom: 1rem;
        color: var(--text-color);
        background: linear-gradient(90deg, #71797E, #C0C0C0);
    }

    th {
        font-weight: 400;
        color: rgb(0, 0, 0);
    }

    .table th,
    .table td {
        padding: 0.75rem;
        vertical-align: top;
        border-top: 6px solid rgb(0, 0, 0);
        background: #98c1d9;
    }

    /* Modal */
    .modal-content {
        border-radius: 15px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
    }

    .modal-header {
        background-color: #343a40;
        color: #ffffff;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
    }

    .modal-title {
        font-size: 1.5rem;
        font-weight: 600;
    }

    .modal-body {
        padding: 20px;
        margin-left: 5px;
    }

    .modal-footer {
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        background-color: #343a40;
    }

    /* Buttons inside modal */
    .btn-secondary {
        background-color: #6c757d;
        color: #fff;
        border-radius: 8px;
        padding: 8px 20px;
    }

    .btn-secondary:hover {
        background-color: #5a6268;
    }

    /* Update Modal */
    #updateModal {
        background: rgba(0, 0, 0, 0.5);
    }

    .update-modal-content {
        border-radius: 15px;
        box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
        margin-top: 50px;
        background: #ffffff;
        height: 600px;
    }

    .update-modal-header {
        background-color: #343a40;
        color: #ffffff;
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
        color: #000000;
    }

    .update-modal-footer {
        border-bottom-left-radius: 15px;
        border-bottom-right-radius: 15px;
        background-color: #343a40;
        padding: 15px;
    }

    .update-form-label {
        color: #000000;
        font-weight: 500;
    }

    .update-form-input {
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        color: #000000;
    }

    .update-form-input:focus {
        outline: none;
        border-color: #007bff;
    }

    /* Button styling */
    .btnla {
        padding: 8px 16px;
        border: none;
        border-radius: 4px;
        text-decoration: none;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s;
    }

    .btn-view {
        background-color: #6c757d;
        color: #fff;
    }

    .btn-view:hover {
        background-color: #5a6268;
    }

    .btn-update {
        background-color: #6c757d;
        color: #fff;
    }

    .btn-update:hover {
        background-color: #5a6268;
    }

    .btn-delete {
        background-color: #dc3545;
        color: #fff;
    }

    .btn-delete:hover {
        background-color: #5a6268;
        }
  }
</style>
</body>
</html>