<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList,prodotto.ProductBean,java.text.DecimalFormat,acquisto.Cart"%>

<%
HttpSession sessione = request.getSession();
ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>) sessione.getAttribute("products1");
DecimalFormat df = new DecimalFormat("#.##");

if (prodotti == null || prodotti.isEmpty()) {
	response.sendRedirect(request.getContextPath() + "/Shop");
	return;
}

Cart carrello =(Cart) sessione.getAttribute("cart");
int v = -1;
//ArrayList<ProductBean> prodotti = new ArrayList();
%>


<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<script type="text/javascript" src="JS/scripts.js"></script>
<link href="CSS/style.css" rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="img/logo/logo.svg">
<title>Part-C</title>
</head>

<body>

	<jsp:include page='header.jsp'>
		<jsp:param name="PageTitle" value="index" />
	</jsp:include>

	<!-- Start Hero Section -->
	<div class="hero">
		<div class="containerTitle">
			<h1>Shop</h1>
		</div>
	</div>
	<!-- End Hero Section -->
	<main>
		<div class="row">
			<div class="column">
				<div class="category">
  					<h2>Categorie</h2>
 					
 					<div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=Motherboard&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconMb.png" alt=""><span>Schede Madre</span>
            			</a>
          			</div>
          			 <div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=CPU&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconCPU.png" alt=""><span>Processori</span>
            			</a>
          			</div>
          			 <div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=RAM&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconRAM.png" alt=""><span>RAM</span>
            			</a>
          			</div>
          			 <div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=GPU&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconGPU.png" alt=""><span>Schede Video</span>
            			</a>
          			</div>
          			 <div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=PSU&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconPSU.png" alt=""><span>Alimentatori</span>
            			</a>
          			</div>
          			 <div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=Storage&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconSSD.png" alt=""><span>Archiviazione</span>
            			</a>
          			</div>
          			<div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=Case&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconCase.png" alt=""><span>Case</span>
            			</a>
          			</div>          			 
          			<div class="categoryItem">
            			<a class="selectionMenu" href="Shop?filter=Acc&action=categoria">
              				<img class="categoryIcon" src="img/icons/iconAcc.png" alt=""><span>Accessori</span>
            			</a>
          			</div>
				</div>
			</div>
			<div class="column2">
				<section class="Shop">
					<div class="ShopRow">
						<%if (prodotti.isEmpty()) {%>
						<div class="productContainer">
							<a class="productItem" id="empty"> <img
								src="img/products/emptyProduct.png"
								class="ProductImage productImg" id="emptyImg">
								<h3 class="productTitle">SHOP VUOTO</h3>
							</a>
						</div>

						<%} else if (!prodotti.isEmpty()) {%>
						<%for (ProductBean p : prodotti) {%>
						<div id="shopProduct" class="productContainer">
							<a class="productItem"> <img
								src="<%=request.getServletContext().getContextPath()%>/<%=p.getPhoto()%>"
								class="ProductImage productImg">
								<h3 class="productTitle"><%=p.getName()%></h3> <strong
								class="productPrice"><%=df.format(p.getPrice())%>
									&#128;</strong> <span class="crossIcon"
								onclick="openPopup('<%=p.getCode()%>')"> <img
									src="img/icons/cross.svg" class="ProductImage">
							</span>
							</a>
						</div>
						<%}}%>
					</div>
			</div>
		</div>
			<div class="popup-overlay" id="popupOverlay">
				<div class="popup" id="popup">
					<a class="close" id="closePopup" onclick="closePopupFunc()">x</a>
					<div class="popup-content">
						<p>inserisci quantita':</p>
						<div class="wau">
							<input type="number" placeholder="quantita'" id="inputQty" min="1">
						</div>
						<a class="addcart" onclick="modificaCarrello('add')">Aggiungi al carrello</a>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<!--Jquery-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js">
	</script>

	
	<jsp:include page='footer.html'>
		<jsp:param name="PageTitle" value="index" />
	</jsp:include>
</body>
</html>