<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Staff</title>

    <!-- Boxicons -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="header.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Header -->
    <header>
        <a href="homeindex.jsp" class="logo"><i class='bx bxs-home'></i>Kolam Mancing D'sentos</a>
        <ul class="navlist"></ul>
        <div class="nav">
            <div class="bx bx-menu" id="menu-icon"></div>
        </div>    
    </header>

    <div class="wrapper">
        <img src="img/images1.jpg" alt="">
        <h2 class="text-right">Welcome</h2>
        <div class="form-wrapper login">
            <form action="loginstaffcontroller" method="post" autocomplete="off" onsubmit="return validateLogin()">
                <h2>Login</h2>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="person"></ion-icon>
                    </span>
                    <input type="text" id="username" name="StaffName" placeholder="Username" required>
                </div>
                <div class="input-box">
                    <span class="icon">
                        <ion-icon name="lock-closed"></ion-icon>
                    </span>
                    <input type="password" name="StaffPass" placeholder="Password" required>
                </div>
                <button type="submit" value="Sign In">Login</button>
            </form>
        </div>
    </div>

    <!-- Modal for successful login -->
    <div class="modal fade" id="loginSuccessModal" tabindex="-1" role="dialog" aria-labelledby="loginSuccessModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginSuccessModalLabel">Login Successful</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    You have successfully logged in. Redirecting to your dashboard...
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for invalid login -->
    <div class="modal fade" id="loginErrorModal" tabindex="-1" role="dialog" aria-labelledby="loginErrorModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginErrorModalLabel">Login Failed</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Invalid username or password. Please try again.
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        const wrapper = document.querySelector('.wrapper');

        function registerActive() {
            wrapper.classList.toggle('active');
        }

        function loginActive() {
            wrapper.classList.toggle('active');
        }

        const header = document.querySelector("header");

        window.addEventListener("scroll", function() {
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

        function validateLogin() {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "loginstaffcontroller", true); // Set to true for async operation
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            var username = document.getElementById("username").value;
            var password = document.querySelector("input[name='StaffPass']").value;
            var params = "StaffName=" + username + "&StaffPass=" + password;

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (xhr.responseText === "valid") {
                        // Show success modal
                        var successModal = new bootstrap.Modal(document.getElementById('loginSuccessModal'));
                        successModal.show();

                        // Redirect after a short delay
                        setTimeout(function() {
                            window.location.href = "home.jsp";
                        }, 2000); // Delay to match the modal display
                    } else {
                        // Show error modal
                        var errorModal = new bootstrap.Modal(document.getElementById('loginErrorModal'));
                        errorModal.show();
                    }
                }
            };

            xhr.send(params);
            return false; // Prevent form from submitting the traditional way
        }
    </script>
</body>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Parisienne&display=swap');

    .wrapper {
        position: relative;
        margin-top: 150px;
        width: 800px;
        height: 500px;
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

    /* Modal Styles */
    .modal-content {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .modal-header {
        background: var(--main-color);
        color: white;
        border-bottom: none;
        border-radius: 15px 15px 0 0;
    }

    .modal-title {
        font-size: 1.5rem;
        font-weight: bold;
    }

    .close {
        color: white;
        opacity: 1;
    }

    .close:hover {
        color: #ddd;
        text-decoration: none;
        opacity: 0.7;
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
</html>