<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="model.CatchBean" %>
<%@ page import="jakarta.servlet.RequestDispatcher" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Catch Form</title>
<!-- Box icons -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="header.css" rel="stylesheet">
<!-- Google fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<!-- Header -->
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
<div class="container">
  <button class="back-button" onclick="goBack()">Back</button>
  <h2>Catch Form</h2>
  <form id="catchForm" action="addcatchlistcontroller" method="post" autocomplete="off" onsubmit="return submitForm()">
    <div class="form-group">
        <label for="participantID" id="CustID" name="CustID">Participant ID: <c:out value="${c.custID}"/></label>
        <br><br>
        <label for="participantName" id="CustName" name="CustName">Participant Name: <c:out value="${c.custName}"/></label>
        <br><br>
    </div>
    <div class="form-group">
      <label for="catchName">Catch Name:</label>
      <select id="catchNameDropdown" name="CatchNameDropdown" onchange="toggleOtherCatchName(this.value)" required>
        <option value="" disabled>Select Catch Name</option>
        <option value="Patin">Patin</option>
        <option value="Baung">Baung</option>
        <option value="Keli">Keli</option>
        <option value="Rohu">Rohu</option>
        <option value="Toman">Toman</option>
        <option value="Pacu">Pacu</option>
        <option value="Sebarau">Sebarau</option>
        <option value="Tongsan">Tongsan</option>
        <option value="Other">Other</option>
      </select><br>
      <input type="text" id="otherCatchName" name="OtherCatchName" style="display:none;" placeholder="Enter catch name">
    </div>
    <input type="hidden" id="CatchName" name="CatchName">
    <div class="form-group">
      <label for="catchWeight">Catch Weight (kg):</label>
      <input type="text" id="CatchWeight" name="CatchWeight" required>
    </div>
    <div class="form-group">
      <label for="catchLength">Catch Length (cm):</label>
      <input type="text" id="CatchLength" name="CatchLength" required>
    </div>
    <input type="hidden" id="EventID" name="EventID" value="<%= request.getParameter("EventID") %>">
    <input type="hidden" id="CustID" name="CustID" value="<%= request.getParameter("CustID") %>">
    <input type="hidden" id="EventDetailID" name="EventDetailID" value="${eventDetailID}">
    <button class="submit" type="submit" class="btn">Submit</button><br>
    <button class="reset" type="reset" class="btn">Reset</button>
  </form>
</div>
<!-- Bootstrap Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="successModalLabel">Success</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        New catch has been successfully inserted!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<style>
.container {
  color: var(--text-color);
  max-width: 600px;
  margin: 50px auto;
  margin-top: 150px;
  padding: 20px;
  background: linear-gradient(90deg, var(--other-color), var(--other-color));
  border-radius: 50px;
  border: 1px solid #ccc;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
h2 {
  color: var(--text-color);
  text-align: center;
  margin-bottom: 20px;
}
.form-group {
  margin-bottom: 20px;
}
label {
  display: block;
  font-weight: bold;
}
input[type="text"],
input[type="number"],
select {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}
.submit {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  color: #fff;
  background-color: #007bff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
.submit:hover {
  background-color: #0056b3;
}
.reset {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  color: #fff;
  background-color: #ff000097;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}
.reset:hover {
  background-color: #ff0000b3;
}
.back-button {
  display: inline-block;
  margin-bottom: 20px;
  padding: 10px 20px;
  font-size: 16px;
  color: #fff;
  background-color: #6c757d;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  transition: background-color 0.3s ease;
}
.back-button:hover {
  background-color: #5a6268;
}
</style>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
function goBack() {
    window.history.back();
}
function toggleOtherCatchName(value) {
    var otherCatchNameInput = document.getElementById('otherCatchName');
    if (value === 'Other') {
        otherCatchNameInput.style.display = 'block';
        otherCatchNameInput.required = true;
    } else {
        otherCatchNameInput.style.display = 'none';
        otherCatchNameInput.required = false;
    }
}
function submitForm() {
    var dropdown = document.getElementById('catchNameDropdown');
    var otherInput = document.getElementById('otherCatchName');
    var hiddenCatchName = document.getElementById('CatchName');
    if (dropdown.value === 'Other') {
        hiddenCatchName.value = otherInput.value;
    } else {
        hiddenCatchName.value = dropdown.value;
    }
    // Show the modal
    var successModal = new bootstrap.Modal(document.getElementById('successModal'));
    successModal.show();
    return true;
}
</script>
</body>
</html>
