<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>view profile cust</title>
  <link href="header.css" rel="stylesheet">

  <!---box icons--->	
  <link rel="stylesheet"
  href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" 
  rel="stylesheet">
  
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
		<a href="loginstaff.jsp" >LOG OUT<i class='bx bx-log-out' ></i></a>
		<div class="bx bx-menu" id="menu-icon"></div>
	</div>	
</header>

  <div class="wrapper">
    <div class="form-wrapper sign-in">
      <form action="">
        <h2>Profile Detail</h2>
        <input type="hidden" class="form-control" id="staff" name="StaffID" value="<c:out value="${sessionScope.StaffID}"/>">
        <div class="input-group">
          <br><br>
          <label for="name">Staff ID :<br> <c:out value="${sessionScope.StaffID}"/> </label>
        </div>
        <div class="input-group">
          <br><br>
          <label for="name">Username :<br> <c:out value="${sessionScope.StaffName}"/> </label>
        </div>
        <div class="input-group">
          <br><br>
          <label for="phone">Phone number:<br> <c:out value="${sessionScope.StaffPhoneNum}"/></label>
        </div>
        <div class="input-group">
            <br><br>
            <label for="email">Email:<br>  <c:out value="${sessionScope.StaffEmail}"/></label>
        </div>
        <div class="input-group">
            <br><br>
            <label for="password">Password:<br> <c:out value="${sessionScope.StaffPass}"/></label>
        </div>
       
        
        <div class="btn-update"> 
		  <a class="btn2" href="updatestaffnewcontroller?StaffID=<c:out value="${sessionScope.StaffID}"/>">Update</a> 
		  <a class="btn2" id="<c:out value="${sessionScope.StaffID}"/>" onclick="confirmation(this.id)">Delete</a>
		 </div>
		 
		 
        
       
      </form>
    </div>
  </div>
</body>
<script>
function confirmation(staffID) {					  		 
	console.log(staffID);
	var r = confirm("Are you sure you want to delete?");
	if (r == true) {				 		  
		location.href = 'deletestaffcontroller?StaffID=' + staffID;
		alert("Staff member successfully deleted");			
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

sr.reveal ('.home-text',{delay:100});
sr.reveal ('.home-img',{delay:100});
sr.reveal ('.container-box',{delay:100});
sr.reveal ('.about-img',{delay:100});
sr.reveal ('.about',{delay:100});
sr.reveal ('.contact',{delay:100});
sr.reveal ('.scroll',{delay:100});



</script>

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
  color: var(--text-color);
  text-align: center;
}
.input-group {
  position: relative;
  margin: 30px 0;
  border-bottom: 2px solid var(--text-color);
}
.input-group label {
  position: absolute;
  top: 50%;
  left: 5px;
  transform: translateY(-50%);
  font-size: 16px;
  color: var(--text-color);
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

.btn2 {
  position: relative;
  width: 100%;
  height: 40px;
  margin:40px;
  padding:1.85px;
  background: var(--main-color);
  font-size: 16px;
  color: #000;
  font-weight: 100px;
  cursor: pointer;
  border-radius: 30px;
  border: none;
  outline: none;
}


</style>



</html>