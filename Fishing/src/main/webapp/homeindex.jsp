<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home-INDEX</title>
<link href="header.css" rel="stylesheet">
<!---box icons--->	
<link rel="stylesheet"
href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" 
rel="stylesheet">

<!---google fonts--->	
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

</head>
<body>
<!---header--->
<header>
	<a href="#" class="logo"><i class='bx bxs-home'></i>Kolam Mancing D'sentos</a>
	
	<ul class="navlist">
		<li><a href="homeindex.jsp" >HOME</a></li>
		
		<li><a href="loginstaff.jsp">STAFF</a></li>
	</ul>
	
	<div class="nav">
		<div class="bx bx-menu" id="menu-icon"></div>
	</div>	
	
	<div class="nav">
		<a href="logincust.jsp" >LOG IN<i class='bx bx-log-in' ></i></a>
		<div class="bx bx-menu" id="menu-icon"></div>
	</div>
</header>

<br><br><br><br><br>
<!---home--->
<section class="home" id="home">
	<div class="home-content">
		<div class="home-text">
			<h1>"Time spent <span>Fishing </span> <br> is never <span>wasted"</span> <br> </h1><br>
			<a href="signupcust.jsp" class="btn">Register now<i class='bx bxs-plus-square'></i></a>
		</div>
	</div>
</section>
<br><br>


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

<!---link to js---> 
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
</body>

<style>
	@charset "ISO-8859-1";

.home{
	position: relative;
	height: 80vh;
	width: 80%;
	margin: 0 auto; /* Center the home section */
	display: flex;
	align-items: center;
	justify-content: center;
	background-image: url('img/img1.jpg');
	background-size: cover;
	background-position: center;
	border-radius: 100px;
}
.home-content{
	text-align: center;
	padding: 20px;
	border-radius: 10px;
	width: 100%; /* Ensure the home-content takes full width of home section */
}
.home-text h1{
	font-size: var(--big-font);
	font-weight: 700;
	line-height: 1.3;
	margin-bottom: 3rem;
	color: #fff;
}
span{
	color: #98c1d9;
}
.btn{
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
.btn i{
	vertical-align: middle;
	margin-left: 5px;
	font-size: 30px;
}
.btn:hover{
	background: var(--main-color);
	color: var(--bg-color);
	box-shadow: #98c1d9 0px 1px 25px;
}

.container{
	padding: 30px 14% 70px;
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, auto));
	gap: 2rem;
	text-align: center;	
}
.container-box{
	padding: 43px 43px 43px 43px;
	background: var(--other-color);
	border-radius: 3rem;
}
.container-box img{
	width: 100%;
	max-width: 300px;
	height: auto;
	margin: 0 auto; /* Centering the image */
}
.container-box h3{
	font-size: 21px;
	font-weight: bold;
	margin: 16px 0;
}
.container-box a{
	color: var(--second-color);
	font-size: var(--p-font);
	letter-spacing: 1px;
	transition: all .50s ease;
}
.container-box a:hover{
	color: var(--main-color);
}

.about{
	display: grid;
	grid-template-columns: repeat(2,1fr);
	align-items: center;
	gap: 4 rems;
}
.about-img img{
	width: 100%;
	height: auto;
	margin: 0 auto; /* Centering the image */
	border-radius:100px;
}
.about-text h2{
	text-align: center;
	font-size: var(--h2-font);
	line-height: 1.3;
	margin-bottom: 2rem;
	margin-left:50px;
}
.about-text p{
	text-align: center;
	color: var(--second-color);
	font-size: var(--p-font);
	line-height: 30px;
	margin-bottom: 3rem;
	margin-left:50px;
}
.about-text a{
	margin-left:230px;
}

.about-text .btn{
    align-items: center;
}

/*start footer*/
.contact-text{
	text-align: center;
	margin-bottom: 4rem;
}

.contact-text h2{
	text-align: center;
	font-size: var(--h2-font);
	margin-bottom: 10px;
	color: var(--main-color);
}

.contact-text p{
	text-align: center;
	color: var (--second-color);
	font-size: var (--p-font);
	line-height: 30px;
	margin-bottom: 3rem;	
}

.social i{
	display: inline-block;
	font-size: 40px;
	color: var (--main-color);
	margin: 0 20px;
	transition: all .50s ease;
}

.social .clr i{
	color: var (--main-color);
}

.social i:hover{
	color: var (--main-color);
}

/*end footer*/


</style>
</html>
