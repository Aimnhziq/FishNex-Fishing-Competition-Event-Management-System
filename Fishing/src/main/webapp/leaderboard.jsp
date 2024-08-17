<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Leaderboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
</head>
<body>

    <div class="containers">
	        <h3>Leaderboard</h3>
	        
	        <div class="event-descz">
                    <h4>Point for each fish type :</h4>
                    <p> Patin,Pacu,Tongsan : <strong>Catch Weight + 0.3 Point </strong></p>
                    <p>Baung,Rohu,Toman,keli : <strong>Catch Weight + 0.5 Point </strong> </p>
                    <p>Other : <strong>Catch Weight + 0.8 Point </strong> </p>
                    
                </div>
                <br>
	        <table border="1" id="leaderboardTable" class="table table-striped table-bordered">
	            <thead>
	                <tr>
	                    <th>Rank</th>
	                    <th>Participants Name</th>
	                    <th>Catch Detail</th>
	                    <th>Points</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="leader" items="${leaders}">
	                    <tr>
	                        <td><c:out value="${leader.rank}" /></td>
	                        <td><c:out value="${leader.custName}" /></td>
	                        <td><c:out value="${leader.catchName}" /></td>
	                        <td><c:out value="${leader.points}" /></td>
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
	    $('#example').DataTable({
	        "paging": true,
	        "lengthChange": true,
	        "searching": true,
	        "ordering": true,
	        "info": true,
	        "autoWidth": true,
	        "responsive": true
	    });
        
    });
</script>
<style>
/* Existing CSS styles */

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 50px;
    background: var(--second-color);
    margin-top: 60px;
    text-align: center;
    color: #000000;
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


.event-descz {
    background-color: #f0f0f0; /* Change background color */
    border: 1px solid #ccc; /* Add border */
    border-radius: 10px; /* Add border radius */
    padding: 20px; /* Add padding */
    width: 60%;
    text-align: center;
    justify-content: center;
    margin-left: 250px;
    
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
    color: var (--other-color);
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
