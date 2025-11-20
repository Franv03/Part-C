<%--suppress LossyEncoding --%>
<!DOCTYPE html>
<html lang="it" dir="ltr">
<%@ page
	import="acquisto.Cart,java.util.ArrayList,prodotto.ProductBean,java.text.DecimalFormat,utente.User"%>
<%
	User user = (User)session.getAttribute("user");

	double subtotale = 0.00;
	double totale = 0.00;
	
	DecimalFormat df = new DecimalFormat("#.##");

	Cart c = (Cart)request.getSession().getAttribute("cart"); 
	ArrayList<ProductBean> prodotti = new ArrayList<ProductBean>();
	if(c != null) prodotti = c.getProducts();
	if(c == null) c = new Cart(); 
	
	%>
<head>
<link rel="shortcut icon" type="image/gif" href="img/logo.png">
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/style.css">

<title>Part-C</title>
</head>

<body>

	<jsp:include page='header.jsp'>
		<jsp:param name="PageTitle" value="cart" />
	</jsp:include>
	<!-- Start Hero Section -->
	<div class="hero">
		<div class="containerTitle">
			<h1>Carrello</h1>
		</div>
	</div>
	<!-- End Hero Section -->
	<main>
		<div class="bg">
			<section>
				<div class="cartContainer">
					<div class="cart">
						<%if(c.getCount()==0){ %>
						<!-- empty cart placeholder -->
						<div class="itemContainer" id="empty-cart-message">
							<div class="cart-item">
								<div class="cartRow">
									<div class="imgContainer center-item">
										<img id="pImg" class="kaioken" src="img/products/emptyProduct.png" alt="">
										<h5 >Il tuo carrello e' vuoto</h5>
									</div>
									<div class="dataContainer center-item">
										<h5>Non ci sono articoli nel tuo carrello. Torna al
											negozio e aggiungi alcuni!</h5>
									</div>
								</div>
							</div>
						</div>

						<%}else{ 
			  	for(ProductBean b : prodotti){
			 		subtotale += (b.getPrice() * b.getQuantity());
			 		totale = subtotale + 50;%>
						<!-- items -->

						<div class="itemContainer">
							<div class="cart-item">
								<div class="cartRow">
									<img id="pImg2" src="<%=b.getPhoto()%>" alt="">
									<h5 class="itemName"><%=b.getName()%></h5>
									<h5>
										<span id="price"><%=df.format(b.getPrice()*b.getQuantity())%> &#128;</span>
									</h5>
									<div class="last">
										<div class="dataContainer center-item">
											<h5>
												<span id="Qty"><%=df.format(b.getQuantity())%></span>
											</h5>
											<a class="modifyBtn" href="CartServlet?id=<%=b.getCode()%>&action=remove&quantity=<%=b.getQuantity()%>">
												<img src="img/icons/iconTrash.png" alt="" class="removeItem">
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>

						<%} %>
						
					<!-- <%//if(c.getCount()!=0){ %>
						<div class="itemContainer">
							<div class="cart-item">
								<div class="cartRow">
									<img id="pImg2" src="img/icons/truck.svg" alt="">
									<h5 class="itemName">Spedizione</h5>
									<h5>
										<span id="price">50</span> &#128;
									</h5>
									<div class="last">
										<div class="dataContainer center-item">
											<h5>
												<span id="Qty">1</span>
											</h5>
											<a class="modifyBtn">
												
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<%//} %> -->
						<div class="itemContainer">
							<div class="cart-item">
								<div class="cartRow">
								
									<div class="generiContainer"><h5>Subtotale:</h5></div>
									<div class="generiContainer status">
										<h5><span id="totalPrice"><%=df.format(subtotale)%></span> &#128;</h5>
									</div>
									
									<div class="generiContainer"><h5>Spedizione:</h5></div>
									<div class="generiContainer status">
										<h5><span id="totalPrice">50</span> &#128;</h5>
									</div>
									
									<div class="generiContainer"><h5 class="finalPrice">Totale:</h5></div>
									<div class="generiContainer status">
										<h5><span id="totalPrice" class="finalPrice"><%=df.format(totale)%> &#128;</span></h5>
									</div>
									
								</div>
							</div>
							<div class="CheckOutContainer">
								<%if(user != null) {%>
									<a href="pay.html" type="button" class="checkOutBtn">Check Out</a>
								<%}else{%>
									<a href="login.jsp" type="button" class="checkOutBtn">Check Out</a>
								<%} %>
							</div>
						</div>
						<%} %>
					</div>
				</div>
			</section>
		</div>
	</main>

	<jsp:include page="footer.html"></jsp:include>

	<script type="text/javascript" src="JS/scripts.js"></script>
</body>

</html>