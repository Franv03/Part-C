<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,prodotto.ProductBean,java.text.DecimalFormat"%> <!-- CARRELLO!!!!!!!!!!!!!!!!!!!!!!!!!!! -->  
 
<%
HttpSession sessione = request.getSession();
ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>) request.getAttribute("products");
DecimalFormat df = new DecimalFormat("#.##");

if(prodotti==null || prodotti.isEmpty()){
	response.sendRedirect(request.getContextPath()+"/Index");
	return;
}
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
			<%if(prodotti.isEmpty()){%>
				<div class="productContainer">
					<a class="productItem" id="empty">
						<img src="img/products/emptyProduct.png" class="ProductImage productImg" id="emptyImg">
						<h3 class="productTitle">SHOP VUOTO</h3>
					</a>
				</div>
				
			<%}else if(!prodotti.isEmpty()) {%>
				<%for(ProductBean p : prodotti) {%>
				<div class="productContainer">
					<a class="productItem">
						<img src="<%=request.getServletContext().getContextPath()%>/<%=p.getPhoto()%>" class="ProductImage productImg">
						<h3 class="productTitle"><%=p.getName()%></h3>
						<strong class="productPrice"><%=df.format(p.getPrice())%> &#128;</strong>

						<span class="crossIcon" onclick="openPopup('<%=p.getCode()%>')">
							<img src="img/icons/cross.svg" class="ProductImage">
						</span>
					</a>
				</div>
			<%}}%>
			</div>
				<div class="popup-overlay" id="popupOverlay">
					<div class="popup" id="popup">
						<a class="close" id="closePopup" onclick="closePopupFunc()">x</a>
						<div class="popup-content">
							<p>inserisci quantita':</p>
							<div class="wau">
								<input type="number" placeholder="quantita'" id="inputQty"
									min="1">
							</div>
							<a class="addcart">Aggiungi al carrello</a>
						</div>
					</div>
				</div>
		</section>
	</main>
	<jsp:include page='footer.html'>
		<jsp:param name="PageTitle" value="index"/>
	</jsp:include>
</body>
</html>