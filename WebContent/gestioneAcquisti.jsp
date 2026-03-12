<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.util.ArrayList,acquisto.Ordine,java.text.DecimalFormat"%>

<%
ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getAttribute("ordini");
DecimalFormat df = new DecimalFormat("#.00");
%>

<!DOCTYPE html>

<html lang="it">

<head>
<meta charset="UTF-8">
<link href="CSS/style.css" rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="img/logo/logo.svg">
<title>Gestione Acquisti</title>

<!-- NAVBAR -->

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

</head>

<body>

<main>
<div class="bg">
<div class="container">

<h2 style="text-align:center;">Gestione Acquisti</h2>

<!-- FILTRO -->

<div class="filterAdmin">


<a href="Ordini" class="addBtn">RIMUOVI FILTRO</a>


<form class="filterForm" method="POST" action="Ordini">

<input name="user" id="orderFilter" type="text" placeholder="Email utente..."/>

<input type="date" name="start" value="<%=java.time.LocalDate.now()%>"/>

<input type="date" name="end" value="<%=java.time.LocalDate.now()%>"/>

<button type="submit" class="addBtnFilter">FILTRA</button>

</form>
</div>

<%
if(ordini != null && !ordini.isEmpty()){
for(Ordine o : ordini){
%>

<div class="itemContainer">
<div class="cart-item">
<div class="cartRow">

<h5><%=o.getEmail()%></h5>

<h5>Ordine #<%=o.getID_ordine()%></h5>

<h5><%=o.getData_acquisto()%></h5>

<h5>Quantità: <%=o.getQ_acquisto()%></h5>

<h5><%=o.getNome_prodotto()%></h5>

<h5><%=o.getCategoria_prodotto()%></h5>

<h5><%=df.format(o.getPrezzo())%>€</h5>

</div>
</div>
</div>

<%
}
} else {
%>

<p style="text-align:center;">Nessun ordine trovato</p>

<%
}
%>

</div>
</div>
</main>

</body>
</html>
