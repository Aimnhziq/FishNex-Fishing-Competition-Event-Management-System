<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Event</title>
<!-- Box icons -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="header.css" rel="stylesheet">

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
        <a href="loginstaff.jsp">LOG OUT<i class='bx bx-log-out'></i></a>
        <div class="bx bx-menu" id="menu-icon"></div>
    </div>  
</header>

<h2>Update Event</h2>

<div class="container">
    <div class="form-wrapper sign-in">
        <form action="updateeventcontroller" method="post" enctype="multipart/form-data" onsubmit="showModal(event)">
            <div class="input-group">
                <label for="eventName">Event Name:</label>
                <input type="text" id="EventName" name="EventName" value="<c:out value='${c.eventName}'/>" required>
            </div>
            <div class="input-group">
                <label for="eventFee">Fee Price:</label>
                <input type="text" id="EventFee" name="EventFee" value="<c:out value='${c.eventFee}'/>" required>
            </div>
            <div class="input-group">
                <label for="eventDetail">Event Detail:</label>
                <textarea id="EventDetail" name="EventDetail" rows="4" required><c:out value='${c.eventDetail}'/></textarea>
            </div>
            <div class="input-group">
                <label for="eventLocation">Event Location:</label>
                <input type="text" id="EventLocation" name="EventLocation" value="<c:out value='${c.eventLocation}'/>" required>
            </div>
            <div class="input-group">
                <label for="eventDate">Date:</label>
                <input type="date" id="EventDate" name="EventDate" value="<c:out value='${c.eventDate}'/>" required>
            </div>
            <div class="input-group">
                <label for="startTime">Start Time:</label>
                <input type="time" id="StartTime" name="StartTime" value="<c:out value='${c.startTime}'/>" required>
            </div>
            <div class="input-group">
                <label for="endTime">End Time:</label>
                <input type="time" id="EndTime" name="EndTime" value="<c:out value='${c.endTime}'/>" required>
            </div>
            <div class="input-group">
                <label for="eventImage">Event Picture:</label>
                <input type="file" id="picture" name="EventPicture" accept="image/*" >
            </div>
            <input type="hidden" id="EventID" name="EventID" value="<c:out value='${c.eventID}'/>">
            <div class="btn-container">
                <input type="submit" value="Update">
                <input type="reset" value="Reset">
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="successModalLabel">Update Successful</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Your event has been successfully updated!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<style>
/*forrm*/

h2{
  text-align: center;
  font-size: 30px;
	color: var(--text-color);
	background: linear-gradient(90deg, var(--other-color), var(--other-color));
	padding: 2px 5px;
	box-shadow: black 0px 1px 3px;
	border-radius: 10px;
	margin-top: 140px;
	width: 350px;
	margin-left: 600px;
}
.container {
    width: 80%; /* Adjust container width as needed */
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background: linear-gradient(90deg, var(--other-color), var(--other-color));
    margin-top: 60px;
	width: 40%;
}

.form-wrapper {
    display: flex;
    flex-direction: column;
}

.input-group {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.input-group label {
    width: 30%; /* Adjust the width as needed */
    margin-right: 10px;
    font-size: 18px; /* Adjust label font size */
    color: #fff; /* Adjust label color */
}

.input-group input[type="date"],
.input-group input[type="time"],
.input-group input[type="text"],
.input-group textarea,
.input-group input[type="file"] {
    width: 70%; /* Adjust the width as needed */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="file"] {
    margin-top: 10px; /* Add margin-top for file input */
}

.btn-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.btn-container input[type="submit"],
.btn-container input[type="reset"] {
    padding: 12px 24px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px; /* Adjust button font size */
    margin: 0 10px;
}

input[type="submit"] {
    background-color: #03fe35;
    color: #fff;
}

input[type="reset"] {
    background-color: #ff0000;
    color: #fff;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

input[type="reset"]:hover {
    background-color: #0056b3;
}

</style>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
function showModal(event) {
    event.preventDefault(); // Prevent form submission

    var myModal = new bootstrap.Modal(document.getElementById('successModal'));
    myModal.show();

    // Submit the form after a short delay to show the modal
    setTimeout(function() {
        event.target.submit();
    }, 2000); // 2 seconds delay
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

sr.reveal('.home-text',{delay:100});
sr.reveal('.home-img',{delay:100});
sr.reveal('.container-box',{delay:100});
sr.reveal('.about-img',{delay:100});
sr.reveal('.about',{delay:100});
sr.reveal('.contact',{delay:100});
sr.reveal('.scroll',{delay:100});
</script>

</body>
</html>
