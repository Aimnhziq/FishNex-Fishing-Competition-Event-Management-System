<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Event</title>
<!-- Box icons -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="header.css" rel="stylesheet">

<!-- Google Fonts -->
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

<h2>Create Event</h2>

<div class="container">
    <form id="EventForm" action="addeventcontroller" method="post" autocomplete="off" enctype="multipart/form-data" onsubmit="return myFunction()">
        <div class="form-group">
            <label for="EventName">Event Name:</label>
            <input type="text" id="name" name="EventName" required>
        </div>
        <div class="form-group">
            <label for="EventFee">Fee Price:</label>
            <input type="text" id="fee" name="EventFee" required>
        </div>
        <div class="form-group">
            <label for="EventDetail">Event Detail:</label>
            <textarea id="detail" name="EventDetail" rows="4" required></textarea>
        </div>
        <div class="form-group">
            <label for="EventLocation">Event Location:</label>
            <input type="text" id="location" name="EventLocation" required>
        </div>
        <div class="form-group">
            <label for="EventDate">Date:</label>
            <input type="date" id="date" name="EventDate" required>
        </div>
        <div class="form-group">
            <label for="StartTime">Start Time:</label>
            <input type="time" id="start" name="StartTime" required>
        </div>
        <div class="form-group">
            <label for="EndTime">End Time:</label>
            <input type="time" id="end" name="EndTime" required>
        </div>
        <div class="form-group">
            <label for="EventPicture">Event Picture:</label>
            <input type="file" id="picture" name="EventPicture" accept="image/*" required>
        </div>
        <div class="button-group">
            <button class="submit" type="submit" class="btn">Submit</button>
            <button class="reset" type="reset" class="btn">Reset</button>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </form>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="eventModalLabel">Event Creation Success</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Event Successfully Created!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<style>

/*form*/

h2{
  text-align: center;
  font-size: 30px;
  color: var(--text-color);
  background: linear-gradient(90deg, var(--other-color), var(--other-color));
  padding: 2px 5px;
  box-shadow: #98c1d9 0px 1px 25px;
  border-radius: 10px;
  margin-top: 140px;
  width: 350px;
  margin-left: auto;
  margin-right: auto;
}
.container {
    width: 80%; /* Adjust container width as needed */
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 50px;
    background: linear-gradient(90deg, var(--other-color), var(--other-color));
    margin-top: 60px;
    width: 40%;
}

.form-group {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

label {
    font-size: 18px; /* Adjust label font size */
    color: #fff; /* Adjust label color */
    margin-right: 10px; /* Space between label and input */
    width: 30%;
}

input[type="date"],
input[type="time"],
input[type="text"],
textarea,
input[type="file"] {
    width: 70%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

.button-group {
    display: flex;
    justify-content: space-between;
}

button {
    padding: 12px 24px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px; /* Adjust button font size */
    margin-top: 20px;
}

button:hover {
    background-color: #0056b3;
}

.reset {
    background-color: #ff0000;
}

.reset:hover {
    background-color: #cc0000;
}

.back-button {
  background-color: #5a6268;
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

function myFunction() {
    // Prevent form submission
    event.preventDefault();

    // Show modal
    var myModal = new bootstrap.Modal(document.getElementById('eventModal'));
    myModal.show();

    // Submit the form after a short delay to show the modal
    setTimeout(function() {
        document.getElementById('EventForm').submit();
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
</script>

</body>
</html>