<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,prodotto.ProductBean"%>

<%
ArrayList<ProductBean> prodotti =
(ArrayList<ProductBean>) request.getAttribute("prodotti");
%>

<!doctype html>
<html lang="it">

<head>
<meta charset="utf-8">
<script type="text/javascript" src="JS/scripts.js"></script>
<link href="CSS/style.css" rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="img/logo/logo.svg">
<title>Amministrazione</title>
</head>

<body>

<header class="navbar">
	<div class="navContainer">
		<div class="centerPosition">
			<a href="index.jsp">
				<img class="logo" src="img/logo/logo.svg">
			</a>
			<a class="navBrand" href="index.jsp">P<span>art-</span>C</a>
		</div>
		<div class="centerPosition">
			<ul class="NavbarSub">
				<li><a class="navLink" href="Admin">Gestione Prodotti</a></li>
				<li><a class="navLink" href="AdminUsers">Gestione Profili</a></li>
				<li><a class="navLink" href="Ordini">Gestione Acquisti</a></li>
			</ul>
		</div>
	</div>
</header>

<main>
<div class="bg">
<section>
<div class="container">
<h2 class = "myh2"">Gestione Prodotti</h2>
<a href="<%=request.getContextPath()%>/admin/aggiungiProd.jsp" class="addBtn">Aggiungi Prodotto</a>

<%
if(prodotti != null && !prodotti.isEmpty()){
    for(ProductBean p : prodotti){
%>

<div class="itemContainer">
<div class="cart-item">
<div class="cartRow">

    <!-- Immagine prodotto -->
    <div class="imgContainer center-item">
        <%
            String foto = p.getPhoto();
            if(foto == null || foto.trim().isEmpty()){
                foto = "default.png";
            }
        %>
        <img id="pImg" src="<%=request.getContextPath()%>/<%=foto%>" alt="<%=p.getName()%>">
    </div>

    <!-- Dati prodotto -->
    <h5><%=p.getCode()%></h5>
    <h5><%=p.getName()%></h5>
    <h5><%=String.format("%.2f", p.getPrice())%> €</h5>
    <h5><%=p.getCategory()%></h5>

    <!-- Azioni -->
    <div class="last">
        <div class="dataContainer center-item">
            
            <!-- Pulsante matita -->
            <a href="javascript:void(0);" class="modifyBtn" 
               onclick="openEditPopup('<%=p.getCode()%>', '<%=String.format("%.2f", p.getPrice())%>', '<%=p.isAvailable() ? 1 : 0%>')">
                <img src="img/icons/pencil.png" class="removeItem">
            </a>

            <!-- Pulsante cestino -->
            <a href="javascript:void(0);" class="modifyBtn" 
               onclick="openDeletePopup('<%=p.getCode()%>')">
                <img src="img/icons/iconTrash.png" class="removeItem">
            </a>

        </div>
    </div>

</div>
</div>
</div>

<%
    }
} else {
%>
<p class="myP">Nessun prodotto disponibile</p>
<%
}
%>

</div>
</section>
</div>
</main>

<!-- Popup modifica prodotto -->
<div class="popup-overlay" id="editPopupOverlay">
    <div class="popup">
        <a class="close" onclick="closeEditPopup()">x</a>
        <h3 id="myH3">Modifica prodotto</h3>
        <form action="<%=request.getContextPath()%>/AggiornaProdottoServlet" method="post">
            <input type="hidden" name="id" id="editCode">

            <label for="editPrice">Prezzo:</label>
            <input type="number" step="0.01" min="0" name="price" id="editPrice" required>

            <label for="editAvailable">Disponibilità:</label>
            <select name="available" id="editAvailable">
                <option value="1">Disponibile</option>
                <option value="0">Non disponibile</option>
            </select>

            <button type="submit" class="btnActionDelete">Salva</button>
        </form>
    </div>
</div>

<!-- Popup conferma eliminazione -->
<div class="popup-overlay" id="deletePopupOverlay">
    <div class="popup">

        <h3>Sei sicuro di eliminare questo prodotto?</h3>
        <form class="popup-content" action="<%=request.getContextPath()%>/EliminaServlet" method="post">
            <input type="hidden" name="id" id="deleteCode">
            <button type="submit" class="btnActionDelete">Sì</button>
            <button type="button" class="btnAction" onclick="closeDeletePopup()">No</button>
        </form>
    </div>
</div>

<script src="JS/admin.js"></script>

</body>
</html>