<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, prodotto.ProductBean, prodotto.ProductDaoDataSource, java.text.DecimalFormat" %>

<%
DecimalFormat df = new DecimalFormat("#.##");

// Recupera i prodotti dal request attribute (impostato dalla ShopServlet)
ArrayList<ProductBean> prodotti = (ArrayList<ProductBean>) request.getAttribute("products1");

if (prodotti == null) {
    prodotti = new ArrayList<>(); // fallback se la lista è vuota
}
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

<div class="hero">
    <div class="containerTitle">
        <h1>Shop</h1>
    </div>
</div>

<main>
    <div class="row">
        
        <div class="column">
            <div class="category">
                <h2>Categorie</h2>
				<div class="categoryItem">
    				<a class="selectionMenu" href="Shop?filter=Tutto&action=categoria">
        				<img class="categoryIcon" src="img/icons/iconAll.png"><span>Tutti i prodotti</span>
    				</a>
				</div>
				
                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=Motherboard&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconMb.png"><span>Schede Madre</span>
                    </a>
                </div>

                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=CPU&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconCPU.png"><span>Processori</span>
                    </a>
                </div>

                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=RAM&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconRAM.png"><span>RAM</span>
                    </a>
                </div>

                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=GPU&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconGPU.png"><span>Schede Video</span>
                    </a>
                </div>

                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=PSU&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconPSU.png"><span>Alimentatori</span>
                    </a>
                </div>

                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=Storage&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconSSD.png"><span>Archiviazione</span>
                    </a>
                </div>

                <div class="categoryItem">
                    <a class="selectionMenu" href="Shop?filter=Case&action=categoria">
                        <img class="categoryIcon" src="img/icons/iconCase.png"><span>Case</span>
                    </a>
                </div>


            </div>
        </div>

        <div class="column2">
            <section class="Shop">
                <div class="ShopRow">

                    <% if (prodotti == null || prodotti.isEmpty()) { %>

                        <div class="productContainer">
                            <a class="productItem" id="empty">
                                <img src="img/products/emptyProduct.png" class="ProductImage productImg" id="emptyImg">
                                <h3 class="productTitle">SHOP VUOTO</h3>
                            </a>
                        </div>

                    <% } else { %>

                        <% for (ProductBean p : prodotti) { %>

                        <div id="shopProduct" class="productContainer">
                            <a class="productItem">
								<div class="imgBox">
                                	<img src="<%=request.getServletContext().getContextPath()%>/<%=p.getPhoto()%>" class="ProductImage productImg">
								</div>
                                <h3 class="productTitle"><%=p.getName()%></h3>

                                <strong class="productPrice">
                                    <%=df.format(p.getPrice())%> &#128;
                                </strong>

                                <span class="crossIcon" onclick="openPopup('<%=p.getCode()%>')">
                                    <img src="img/icons/cross.svg" class="ProductImage">
                                </span>

                            </a>
                        </div>

                        <% } %>

                    <% } %>

                </div>
            </section>
        </div>
    </div>
</main>


<!-- POPUP AGGIUNTA CARRELLO -->
<div class="popup-overlay" id="popupOverlay">
    <div class="popup" id="popup">

        <a class="close" id="closePopup" onclick="closePopupFunc()">x</a>

        <div class="popup-content">

            <p>Inserisci quantità:</p>

            <div class="wau">
                <input type="number" placeholder="quantità" id="inputQty" min="1">
            </div>

            <a class="addcart" onclick="modificaCarrello('add')">
                Aggiungi al carrello
            </a>

        </div>

    </div>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<jsp:include page='footer.html'>
    <jsp:param name="PageTitle" value="index" />
</jsp:include>

</body>
</html>