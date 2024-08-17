<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>update account cust</title>

  <!---box icons--->	
  <link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" 
  rel="stylesheet">
  <link href="header.css" rel="stylesheet">
  
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

  <div class="wrapper">
    <div class="form-wrapper sign-in">
      <form action="updatestaffnewcontroller" method="post" onsubmit="myFunction()">
        <h2>Profile Detail</h2>
        <div class="input-group">
          <input type="text" name="StaffName" value="<c:out value="${sessionScope.StaffName}"/>" minlength="5" maxlength="7" title="Enter username minimum 5 words Only"/>
          <label for="">Username</label>
        </div>
        <div class="input-group">
          <input type="tel" name="StaffPhoneNum" value="<c:out value="${sessionScope.StaffPhoneNum}"/>" minlength="9" maxlength="10" title="Please enter a 10-digit phone number"/>          
          <label for="">Phone number</label>
        </div>
        <div class="input-group">
            <input type="email" name="StaffEmail" value="<c:out value="${sessionScope.StaffEmail}"/>"/>
            <label for="">Email</label>
        </div>
        <div class="input-group">
            <input type="password" name="StaffPass" value="<c:out value="${sessionScope.StaffPass}"/>" minlength="6"/>
            <label for="">Password</label>
        </div>
        
        <input type="hidden" name="StaffID" value="<c:out value="${sessionScope.StaffID}"/>"/><br><br>
        
        
        <div class="btn-container">
		    <div class="btn-save">
		        <input type="submit" value="Submit">
		    </div>
		    <div class="btn-cancel">
		        <input type="reset" value="Reset">
		    </div>
		</div>
        
      </form>
    </div>
  </div>
</body>


<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

.wrapper {
  position: relative;
  width: 400px;
  height: 600px;
  margin: 120px auto; /* Adjust top and bottom margin to center vertically */
  background: linear-gradient(90deg, var(--other-color), var(--other-color));
  border: 1px solid #ccc;	
  border-radius: 20px;
  padding: 40px;
  overflow: hidden;
  display: flex; /* Add Flexbox */
  justify-content: center; /* Center horizontally */
  align-items: center; /* Center vertically */
}

.form-wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  transition: 1s ease-in-out;
}
.wrapper.active .form-wrapper.sign-in {
  transform: translateY(-450px);
}

h2 {
  font-size: 30px;
  color: #000000;
  text-align: center;
}
.input-group {
  position: relative;
  margin: 30px 0;
  border-bottom: 2px solid #000000;
}
.input-group label {
  position: absolute;
  top: 50%;
  left: 5px;
  transform: translateY(-50%);
  font-size: 16px;
  color: #000000;
  pointer-events: none;
  transition: .5s;
}
.input-group input {
  width: 320px;
  height: 40px;
  font-size: 16px;
  color: #fff;
  padding: 0 5px;
  background: transparent;
  border: none;
  outline: none;
}
.input-group input:focus~label,
.input-group input:valid~label {
  top: -5px;
}
/*BUTTON - UPDATE , CANCEL , SAVE*/
/* Styles for the buttons container */
.btn-container {
    display: flex; /* Use flexbox */
    justify-content: space-between; /* Space the buttons evenly */
    margin-top: -20px; /* Adjust as needed */
}

/* Styles for the submit button */
.btn-container .btn-save input[type="submit"] {
    background-color: #4CAF50; /* Green */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

.btn-container .btn-save input[type="submit"]:hover {
    background-color: #45a049; /* Darker green */
}

/* Styles for the reset button */
.btn-container .btn-cancel input[type="reset"] {
    background-color: #f44336; /* Red */
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

.btn-container .btn-cancel input[type="reset"]:hover {
    background-color: #d32f2f; /* Darker red */
}

</style>

<script>
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

sr.reveal ('.home-text',{delay:100});
sr.reveal ('.home-img',{delay:100});
sr.reveal ('.container-box',{delay:100});
sr.reveal ('.about-img',{delay:100});
sr.reveal ('.about',{delay:100});
sr.reveal ('.contact',{delay:100});
sr.reveal ('.scroll',{delay:100});
</script>

</html>