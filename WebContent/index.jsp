<!doctype html>
<html lang="it">

<head>
	<meta charset="utf-8">
	<meta name="description" content="" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
	<link href="css/tiny-slider.css" rel="stylesheet">
	<link href="CSS/style1.css" rel="stylesheet">
	<link rel="icon" type="image/svg+xml" href="img/logo/logo.svg">
	<title>Part-C</title>
</head>

<body>

<jsp:include page='header.jsp'>
	<jsp:param name="PageTitle" value="index"/>
</jsp:include>

	<!-- Start Hero Section -->
	<div class="hero">
		<div class="containerTitle">
			<h1>Home</h1>
		</div>
	</div>
	<!-- End Hero Section -->
	<main>
		<div class="divider"><span>PRODOTTI CONSIGLIATI</span></div>


		<section class="homeShop">
			<div class="homeRow">

				<div class="productContainer">
					<a class="productItem" href="#">
						<img src="img/product-3.png" class="ProductImage productImg">
						<h3 class="productTitle">Nordic Chair</h3>
						<strong class="productPrice">$50.00</strong>

						<span class="crossIcon">
							<img src="img/icons/cross.svg" class="ProductImage">
						</span>
					</a>
				</div>
				
				<div class="productContainer">
					<a class="productItem" href="#">
						<img src="img/product-3.png" class="ProductImage productImg">
						<h3 class="productTitle">Nordic Chair</h3>
						<strong class="productPrice">$50.00</strong>

						<span class="crossIcon">
							<img src="img/icons/cross.svg" class="ProductImage">
						</span>
					</a>
				</div>

			</div>
		</section>
	</main>

	<footer class="navbar" id="footer">
		<div class="navContainer">
			<div class="centerPosition" id="footerPosition">
				<img class="logo" src="img/logo/logo.svg">
				<a class="navBrand">P<span>art-</span>C</a>
			</div>
			<div class="centerPosition">
				<ul class="NavbarSub">
					<li><a class="navLinkFooter" href="#">Contatti</a></li>
					<li><a class="navLinkFooter" href="#">Chi siamo</a></li>
				</ul>
			</div>
		</div>
	</footer>

	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/tiny-slider.js"></script>
	<script src="js/custom.js"></script>
</body>

</html>