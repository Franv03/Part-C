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
				<li><a class="navLink" href=AdminUsers>Gestione Profili</a></li>
				<li><a class="navLink" href="Ordini">Gestione Acquisti</a></li>
				<li><a class="navIconLink" href="Logout">
					<img class="navIcon" src="img/icons/userLog.png">
				</a></li>
			</ul>
		</div>
	</div>
</header>

</head>

<body>

<main class="bgPage">
<div class="bg">
<section>
<div class="container">
<h2 style="text-align:center;">Gestione Prodotti</h2>
<a href="<%=request.getContextPath()%>/aggiungiProd.jsp" class="btn">
    Aggiungi Prodotto
</a>
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

            <!-- Azioni: matita e cestino -->
            <div class="last" id="lastBtn">
                <div class="dataContainer center-item">
                    
                    <!-- Pulsante matita -->
                    <a href="javascript:void(0);" class="modifyBtn" onclick="toggleEditForm('<%=p.getCode()%>')">
                        <img src="img/icons/pencil.png" class="removeItem">
                    </a>

                    <!-- Form nascosto modifica prodotto -->
                    <div id="editForm<%=p.getCode()%>" class="editForm" style="display:none; margin-top:5px;">
                        <form action="<%=request.getContextPath()%>/AggiornaProdottoServlet" method="post">
                            <input type="hidden" name="id" value="<%=p.getCode()%>">

                            Prezzo: 
                            <input type="number" step="0.01" min="0" name="price" 
                                   value="<%=String.format("%.2f", p.getPrice())%>" style="width:70px;">

                            Disponibile:
                            <select name="available">
                                <option value="1" <%=p.isAvailable() ? "selected" : ""%>>Disponibile</option>
                                <option value="0" <%=!p.isAvailable() ? "selected" : ""%>>Non disponibile</option>
                            </select>

                            <button type="submit" style="margin-left:5px;">Salva</button>
                        </form>
                    </div>

                    <!-- Pulsante cestino -->
                    <a href="javascript:void(0);" class="modifyBtn" onclick="toggleDeleteForm('<%=p.getCode()%>')">
                        <img src="img/icons/iconTrash.png" class="removeItem">
                    </a>

                    <!-- Form nascosto conferma eliminazione -->
                    <div id="deleteForm<%=p.getCode()%>" class="editForm" style="display:none; margin-top:5px;">
                        <form action="<%=request.getContextPath()%>/EliminaServlet" method="post">
                            <input type="hidden" name="id" value="<%=p.getCode()%>">
                            <span>Sei sicuro di voler eliminare questo prodotto?</span>
                            <button type="submit" style="margin-left:5px;">Sì</button>
                            <button type="button" onclick="toggleDeleteForm('<%=p.getCode()%>')" style="margin-left:5px;">No</button>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
</div>

<%
    }
} else {
%>

    <p style="text-align:center;">Nessun prodotto disponibile</p>

<%
}
%>

</div>
</section>
</div>

</main>


<script>
function toggleDeleteForm(code) {
    var form = document.getElementById("deleteForm" + code);
    if(form.style.display === "none" || form.style.display === "") {
        form.style.display = "block";
    } else {
        form.style.display = "none";
    }
}

function toggleEditForm(code) {
    var form = document.getElementById("editForm" + code);
    if(form.style.display === "none" || form.style.display === "") {
        form.style.display = "block";
    } else {
        form.style.display = "none";
    }
}
</script>


</body>
</html>