<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>home-STAFF</title>
    <link href="header.css" rel="stylesheet">
    <!---box icons--->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!---google fonts--->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
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

    <!---main section--->
    <section class="main-section">
        <!---home--->
        <section class="home" id="home">
            <div class="home-content">
                <div class="home-text">
                    <h1>Welcome Staff<br> <span>
                            <label for="name" class=""><c:out value="${sessionScope.StaffName}" /></label> </span> <br><br>
                        Your ID : <span><label for="id" class="child"><c:out value="${sessionScope.StaffID}" /></label></span>
                        <br> </h1>
                </div>
            </div>
        </section>

        <!-- staff dashboard -->
        <section class="dashboard" id="dashboard">
            <div class="container">
                <div class="dashboard-content">
                    <h2>Staff Dashboard</h2>
                    <p>Welcome to the staff dashboard! Here you can manage various aspects of Kolam Pancing D'Sentos efficiently. Use the links below to navigate through the functionalities available to you:</p>
                    <ul class="dashboard-links">
                        <li><a href="listcustcontroller" class="btn">Manage Customers<i class='bx bxs-user'></i></a></li>
                        <li><a href="liststaffcontroller" class="btn">Manage Staff<i class='bx bxs-id-card'></i></a></li>
                        <li><a href="listeventcontroller" class="btn">View Events<i class='bx bxs-calendar-event'></i></a></li>
                        <li><a href="calendercontroller" class="btn">View Schedule<i class='bx bxs-calendar'></i></a></li>
                        <li><a href="addevent.jsp" class="btn">Create New Event<i class='bx bxs-plus-square'></i></a></li>
                    </ul>
                </div>
            </div>
        </section>
    </section>

    <!-- about -->
    <section class="about" id="about">
        <div class="about-img">
            <img src="img/img3.jpg" alt="Fishing at Kolam Pancing D'Sentos">
        </div>
        <div class="about-text">
            <h2>About Kolam Pancing D'Sentos</h2>
            <p>Fishing competitions bring together anglers who enjoy fishing. These events are lively gatherings where participants compete under various rules and goals, some for fun, others for prizes, and many for the thrill of the competition. For many participants, the intrinsic satisfaction of catching a fish and the joy of participating in a cherished pastime are significant motivators. These competitions come in various forms, including high-profile tournaments and localized events, highlighting the need for a versatile fishing competition management system.</p>
            <a href="https://www.facebook.com/kolampancingdsentos/?locale=ms_MY" class="btn">EXPLORE STORY<i class='bx bxs-right-arrow-circle'></i></a>
        </div>
    </section>

    <!-- contact -->
    <section class="contact" id="contact">
        <div class="contact-text">
            <h2>Contact Us</h2>
            <p>"Need assistance or have questions about the competition? Feel free to reach out to us! "
                <br></p>
            <div class="social">
                <a href="#" class="clr"><i class='bx bxl-whatsapp-square'></i></a>
                <a href="https://www.facebook.com/kolampancingdsentos/?locale=ms_MY"><i class='bx bxl-facebook-square'></i></a>
                <a href="#"><i class='bx bxl-instagram'></i></a>
                <a href="#"><i class='bx bxl-twitter'></i></a>
            </div>
        </div>
    </section>

    <!--- scroll top --->
    <a href="#" class="scroll">
        <i class='bx bxs-up-arrow-square'></i>
    </a>

    <script src="https://unpkg.com/scrollreveal"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <!---link to js--->
    <script>
        /* DROPDOWN */
        document.addEventListener("DOMContentLoaded", function () {
            var dropdownToggle = document.querySelectorAll(".dropdown-toggle");
            dropdownToggle.forEach(function (toggle) {
                toggle.addEventListener("click", function (e) {
                    e.preventDefault();
                    var dropdownMenu = this.nextElementSibling;
                    dropdownMenu.style.display = dropdownMenu.style.display === "block" ? "none" : "block";
                });
            });
        });

        const header = document.querySelector("header");
        window.addEventListener("scroll", function () {
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

        sr.reveal('.home-text', { delay: 100 });
        sr.reveal('.home-img', { delay: 100 });
        sr.reveal('.container-box', { delay: 100 });
        sr.reveal('.about-img', { delay: 100 });
        sr.reveal('.about', { delay: 100 });
        sr.reveal('.contact', { delay: 100 });
        sr.reveal('.scroll', { delay: 100 });

        /* Slideshow JS */
        let slideIndex = 1;
        showSlides(slideIndex);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }

        // Automatic Slideshow - change image every 2 seconds
        setInterval(function () {
            plusSlides(1);
        }, 2000);
    </script>
</body>

<style>
    @charset "ISO-8859-1";

    

    

    .main-section {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 2rem;
    }

    .home {
        position: relative;
        height: 92vh;
        margin:  auto;
        display: flex;
        align-items: center;
        justify-content: center;
        background-image: url('img/img1.jpg');
        background-size: cover;
        background-position: center;
        border-radius: 100px;
    }

    .home-content {
        text-align: center;
        padding: 20px;
        border-radius: 10px;
        width: 100%;
    }

    .home-text h1 {
        font-size: var(--big-font);
        font-weight: 700;
        line-height: 1.3;
        margin-bottom: 3rem;
        color: #fff;
    }

    span {
        color: #98c1d9;
    }

    .btn {
        display: inline-block;
        padding: 15px 35px;
        background: var(--other-color);
        color: #fffdfd;
        font-size: var(--p-font);
        font-weight: 500;
        letter-spacing: 1px;
        border-radius: 3rem;
        transition: all .50s ease;
        box-shadow: #fffdfd 0px 1px 25px;
    }

    .btn i {
        vertical-align: middle;
        margin-left: 5px;
        font-size: 30px;
    }

    .btn:hover {
        background: var(--main-color);
        color: var(--bg-color);
        box-shadow: #98c1d9 0px 1px 25px;
    }

    .dashboard {
        padding: 50px 0;
        text-align: center;
    }

    .dashboard-content {
        max-width: 800px;
        margin:  auto;
        background: var(--main-color);
        padding: 20px;
        border-radius: 50px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .dashboard-content h2 {
        font-size: var(--h2-font);
        margin-bottom: 20px;
        color: var(--other-color);
    }

    .dashboard-content p {
        font-size: var(--p-font);
        color: #333;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .dashboard-links {
        list-style-type: none;
        padding: 0;
    }

    .dashboard-links li {
        margin: 10px 0;
    }

    .dashboard-links .btn {
        display: block;
        width: auto;
        margin: 0 auto;
        padding: 10px 20px;
        background: var(--other-color);
        color: #fffdfd;
        font-size: var(--p-font);
        font-weight: 500;
        border-radius: 3rem;
        transition: all .50s ease;
        box-shadow: #fffdfd 0px 1px 25px;
    }

    .dashboard-links .btn i {
        vertical-align: middle;
        margin-left: 5px;
        font-size: 20px;
    }

    .dashboard-links .btn:hover {
        background: var(--main-color);
        color: var(--bg-color);
        box-shadow: #98c1d9 0px 1px 25px;
    }

    .container {
        padding: 30px 14% 70px;
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, auto));
        gap: 2rem;
        text-align: center;
    }

    .container-box {
        padding: 43px 43px 43px 43px;
        background: var(--other-color);
        border-radius: 3rem;
    }

    .container-box img {
        width: 100%;
        max-width: 50px;
        height: auto;
    }

    .container-box h3 {
        font-size: 21px;
        font-weight: bold;
        margin: 16px 0;
    }

    .container-box a {
        color: var(--second-color);
        font-size: var(--p-font);
        letter-spacing: 1px;
        transition: all .50s ease;
    }

    .container-box a:hover {
        color: var(--main-color);
    }

    .about {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        align-items: center;
        gap: 4 rems;
    }

    .about-img img {
        width: 100%;
        height: auto;
        border-radius:100px;
    }

    .about-text h2 {
        text-align: center;
        font-size: var(--h2-font);
        line-height: 1.3;
        margin-bottom: 2rem;
        margin-left: 50px;
    }

    .about-text p {
        text-align: center;
        color: var(--text-color);
        font-size: var(--p-font);
        line-height: 30px;
        margin-bottom: 3rem;
        margin-left: 50px;
    }

    .about-text a {
        margin-left: 230px;
    }

    .about-text .btn {
        align-items: center;
    }

    /* Slideshow container */
    .slideshow-container {
        max-width: 1000px;
        position: relative;
        margin: auto;
        margin-top: 150px;
    }

    /* Hide the images by default */
    .mySlides {
        display: none;
    }

    /* Image styles */
    .mySlides img {
        width: 800px;
        height: 500px;
        object-fit: cover;
    }

    /* Next & previous buttons */
    .prev,
    .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        width: auto;
        margin-top: -22px;
        padding: 16px;
        color: white;
        font-weight: bold;
        font-size: 18px;
        transition: 0.6s ease;
        border-radius: 0 3px 3px 0;
        user-select: none;
    }

    /* Position the "next button" to the right */
    .next {
        right: 0;
        border-radius: 3px 0 0 3px;
    }

    /* On hover, add a black background color with a little bit see-through */
    .prev:hover,
    .next:hover {
        background-color: rgba(0, 0, 0, 0.8);
    }

    /* Caption text */
    .text {
        color: #f2f2f2;
        font-size: 15px;
        padding: 8px 12px;
        position: absolute;
        bottom: 8px;
        width: 100%;
        text-align: center;
    }

    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    /* The dots/bullets/indicators */
    .dot {
        cursor: pointer;
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
    }

    .active,
    .dot:hover {
        background-color: #717171;
    }

    /* Fading animation */
    .fade {
        animation-name: fade;
        animation-duration: 1.5s;
    }

    @keyframes fade {
        from {
            opacity: .4
        }

        to {
            opacity: 1
        }
    }

    /*start footer*/
    .contact-text {
        text-align: center;
        margin-bottom: 4rem;
    }

    .contact-text h2 {
        text-align: center;
        font-size: var(--h2-font);
        margin-bottom: 10px;
        color: var(--main-color);
    }

    .contact-text p {
        text-align: center;
        color: var(--second-color);
        font-size: var(--p-font);
        line-height: 30px;
        margin-bottom: 3rem;
    }

    .social i {
        display: inline-block;
        font-size: 32px;
        color: var(--second-color);
        margin: 0 20px;
        transition: all .50s ease;
    }

    .social .clr i {
        color: var(--main-color);
    }

    .social i:hover {
        color: var(--main-color);
    }

    /*end footer*/
</style>

</html>
