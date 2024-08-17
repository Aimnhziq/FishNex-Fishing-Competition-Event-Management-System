<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>sign up staff</title>

    <!-- Box icons -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

<div class="wrapper">
    <img src="img/images1.jpg" alt="">
    <h2 class="text-right">New</h2>
    
    <div class="form-wrapper register">
        <form action="signupstaffcontroller" method="post" autocomplete="off" onsubmit="myFunction(event)">
            <h2>Registration</h2>
            <div class="input-box">
                <span class="icon">
                    <ion-icon name="person"></ion-icon>
                </span>
                <input type="text" id="username" name="StaffName" placeholder="Full Name" required minlength="5" maxlength="7" title="Enter Staff or manager Only">
            </div>
            <div class="input-box">
                <span class="icon">
                    <ion-icon name="heart"></ion-icon>
                </span>
                <input type="tel" id="phone" name="StaffPhoneNum" placeholder="Phone" required pattern="[0-9]{10}" title="Please enter a 10-digit phone number">
            </div>
            <div class="input-box">
                <span class="icon">
                    <ion-icon name="mail"></ion-icon>
                </span>
                <input type="email" id="email" name="StaffEmail" placeholder="Email" required>
            </div>
            <div class="input-box">
                <span class="icon">
                    <ion-icon name="lock-closed"></ion-icon>
                </span>
                <input type="password" id="password" name="StaffPass" placeholder="Password" required minlength="6">
            </div>
            <button type="submit">Register</button>
        </form>
    </div>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="registrationModal" tabindex="-1" aria-labelledby="registrationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="registrationModalLabel">Registration Success</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Account Successfully Registered!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Ionicons JS -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Parisienne&display=swap');

    .wrapper {
        position: relative;
        margin-top: 150px;
        width: 800px;
        height: 500px;
        background: linear-gradient(90deg, var(--main-color),var(--other-color) );
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
        content: 'Staff';
        position: absolute;
        top: 60px;
        right: -50px;
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
    .wrapper .form-wrapper.login {
        transition: .7s ease-in-out;
        transition-delay: .7s;
    }
    .wrapper.active .form-wrapper.login {
        transition-delay: 0s;
        transform: translateX(-400px);
    }
    h2 {
        font-size: 2em;
        text-align: center;
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
    
    .modal-body {
    padding: 20px;
    font-size: 1rem;
    color: #333;
}

.modal-footer {
    border-top: none;
    padding: 15px;
    text-align: center;
    background: var(--main-color);
    color: white;
}

.modal-footer .btn {
    background: #fff;
    color: var(--main-color);
    border: 1px solid var(--main-color);
    border-radius: 5px;
}

.modal-footer .btn:hover {
    background: var(--main-color);
    color: #fff;
    border-color: var(--main-color);
}

/* Adjust modal sizes if necessary */
.modal-sm {
    max-width: 300px;
}

.modal-lg {
    max-width: 800px;
}
</style>

<script>
function myFunction(event) {
    event.preventDefault();
    var myModal = new bootstrap.Modal(document.getElementById('registrationModal'));
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
