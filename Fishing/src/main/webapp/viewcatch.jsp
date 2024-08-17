<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Catch</title>
<link href="header.css" rel="stylesheet">


<!---box icons--->	
<link rel="stylesheet"
href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" 
rel="stylesheet">

<!---google fonts--->	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?
family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
 

<div class="container">
  <h2>View Catch</h2>
  <form action="" >
    <div class="form-group">
    <input type="hidden" id="catch" name="CatchID" value="<c:out value="${c.catchID}"/>">
      <label for="CatchID">Catch ID :<br> <c:out value="${c.catchID}"/> </label>
    </div>
    <div class="form-group"> 
      <label for="CustID">Cust ID :<br> <c:out value="${c.custID}"/> </label>
    </div>
    <div class="form-group"> 
      <label for="CustName">Cust Name :<br> <c:out value="${c.custName}"/> </label>
    </div>
    <div class="form-group">
      <label for="CatchName">Catch Name :<br> <c:out value="${c.catchName}"/> </label>
    </div>
    <div class="form-group">
      <label for="CatchWeight">Catch Weight (kg):<br> <c:out value="${c.catchWeight}"/> </label>
    </div>
    <div class="form-group">
      <label for="CatchName">Catch Length (cm):<br> <c:out value="${c.catchLength}"/> </label>
    </div>
    
  </form>
</div>

</body>
<style>
 

.container {
  color: var(--text-color);
  margin: 50px auto;
  margin-top: 150px;
  padding: 20px;
  background: linear-gradient(90deg, var(--other-color), var(--other-color));
  border-radius: 50px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  border: 1px solid #ccc;
}

h2 {
  text-align: center;
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  font-weight: bold;
}

input[type="text"],
input[type="number"] {
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


</style>

<script>
  <!---link to js---> 
   
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
