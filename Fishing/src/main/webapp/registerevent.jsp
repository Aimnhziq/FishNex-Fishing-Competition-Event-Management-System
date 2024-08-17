<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Participants</title>

    <!---box icons--->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="header.css" rel="stylesheet">
    
</head>
<body>

<!---header--->
<header>
    <a href="homecust.jsp" class="logo"><i class='bx bxs-home'></i>Kolam Mancing D'sentos</a>
    
    <ul class="navlist">
        <li><a href="homecust.jsp" >HOME</a></li>
        <li><a href="listeventcustcontroller">EVENT</a></li>
        <li><a href="calendercustcontroller">SCHEDULE</a></li>
    </ul>
    
    <div class="nav">
        <a href="viewcust.jsp" class="btn">MY ACCOUNT<i class='bx bxs-user-circle'></i></a>
        <div class="bx bx-menu" id="menu-icon"></div>
    </div>  
</header>

<div class="wrapper">
    <img src="img/QR1.jpg" alt="">
    <h2 class="text-right">New</h2>
    
    <div class="form-wrapper register">
        <form action="registercontroller" method="post" autocomplete="off">
            <h2>Registration</h2>
            
            <div class="input-box">
                <label class="inputbocah" id="CustID" name="CustID" for="name">Participants ID :<br> <c:out value="${sessionScope.CustID}"/> </label>
            </div>
            <div class="input-box">
                <label class="inputbocah" for="name">Username :<br> <c:out value="${sessionScope.CustName}"/> </label>
            </div>
            <div class="input-box">
                <label class="inputbocah" for="phone">Phone number:<br> <c:out value="${sessionScope.CustPhoneNum}"/></label>
            </div>
            <div class="input-box">
                <label class="inputbocah" for="email">Email:<br>  <c:out value="${sessionScope.CustEmail}"/></label>
            </div>
            
            <div class="input-box">
                <span class="icon">
                    <ion-icon name="cash"></ion-icon>
                </span>
                <input type="text" id="receipt" name="CustReceipt" placeholder="Receipt number" required minlength="5" maxlength="10" title="Enter the receipt number">
            </div>
			
            <div class="input-box">
                <input type="hidden" class="form-control" for="password" value="<c:out value="${sessionScope.CustPass}"/>">
                <input type="hidden" id="EventID" name="EventID" value="<%= request.getParameter("EventID") %>">
                <input type="hidden" id="CustID" name="CustID" value="<c:out value="${sessionScope.CustID}"/>">
            </div>
            <button type="submit">Register</button>
        </form>
    </div>
</div>

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
// Function to show alert messages
function showAlert(type, message) {
    alert(message);
}

// Check for error or success messages
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<% String successMessage = (String) request.getAttribute("successMessage"); %>

<% if (errorMessage != null) { %>
    showAlert('error', '<%= errorMessage %>');
<% } %>
<% if (successMessage != null) { %>
    showAlert('success', '<%= successMessage %>');
<% } %>

// Additional scripts
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
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Parisienne&display=swap');

.wrapper {
    position: relative;
    margin-top: 150px;
    width: 800px;
    height: 600px;
    background: linear-gradient(90deg, var(--main-color), var(--other-color));
    border-radius: 50px;
    box-shadow: 0 0 60px rgba(0, 0, 0, .3);
    padding: 60px;
    display: flex;
    align-items: center;
    overflow: hidden;
    position: absolute;
    top: 34%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.wrapper .text-right {
    position: absolute;
    top: 60px;
    right: 180px;
    color: #000000;
    text-shadow: 0 0 20px rgba(0, 0, 0, .3);
    font-size: 50px;
    user-select: none;
}
.wrapper .text-right::before {
    content: 'Participants';
    position: absolute;
    top: 60px;
    right: -130px;
}
.wrapper img {
    position: absolute;
    right: 50px;
    bottom: 50px;
    width: 40%;
    height: 50%;
}
.form-wrapper {
    z-index: 2;
}
h2 {
    font-size: 2em;
    text-align: center;
    color: #000000;
}
.inputbocah {
    color: #000000;
}
.input-box {
    position: relative;
    width: 320px;
    margin: 30px 0;
}
.input-box input {
    width: 100%;
    height: 50px;
    background: transparent;
    border: 2px solid #020202;
    outline: none;
    border-radius: 40px;
    font-size: 1em;
    color: #000000;
    padding: 0 20px 0 40px;
}
.input-box input::placeholder {
    color: rgba(0, 0, 0, 0.651);
}
.input-box .icon {
    position: absolute;
    left: 15px;
    color: #040404;
    font-size: 1.2em;
    line-height: 55px;
}
button {
    width: 100%;
    height: 45px;
    background: var(--other-color);
    border: none;
    outline: none;
    border-radius: 40px;
    cursor: pointer;
    font-size: 1em;
    color: var(--text-color);
    font-weight: 500;
}
.participant-info {
    margin: 20px 0;
    text-align: center;
    font-size: 1.2em;
    color: #333;
}
</style>
</body>
</html>
