<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.util.ArrayList, acquisto.Ordine, java.text.DecimalFormat"%>

<%
ArrayList<Ordine> ordini = (ArrayList<Ordine>) request.getAttribute("ordini");
DecimalFormat df = new DecimalFormat("#.00");

/* recupero valori filtro */
String user = request.getParameter("user");
String start = request.getParameter("start");
String end = request.getParameter("end");

if(user == null) user = "";
if(start == null) start = java.time.LocalDate.now().toString();
if(end == null) end = java.time.LocalDate.now().toString();
%>

<!DOCTYPE html>
<html lang="it">

<head>
<meta charset="UTF-8">
<link href="CSS/style.css" rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="img/logo/logo.svg">
<title>Gestione Acquisti</title>
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
              
        <div class="container">
  <h2 class = "myh2">Gestione Acquisti</h2>

            <!-- FILTRO -->
            <div class="filterAdmin">

                <a href="Ordini" class="addBtn">RIMUOVI FILTRO</a>

                <form class="filterForm" method="POST" action="Ordini">

                    <input name="user" id="orderFilter" type="text" placeholder="Email utente..."
                           value="<%= user %>"/>

                    <input type="date" name="start" value="<%= start %>"/>

                    <input type="date" name="end" value="<%= end %>"/>

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

                        <h5><%= o.getEmail() %></h5>
                        <h5>Ordine #<%= o.getID_ordine() %></h5>
                        <h5><%= o.getData_acquisto() %></h5>
                        <h5>Quantità: <%= o.getQ_acquisto() %></h5>
                        <h5><%= o.getNome_prodotto() %></h5>
                        <h5><%= o.getCategoria_prodotto() %></h5>
                        <h5><%= df.format(o.getPrezzo()) %>€</h5>

                    </div>
                </div>
            </div>

            <%
                }
            } else {
            %>

            <p class="myP">Nessun ordine trovato</p>

            <%
            }
            %>

        </div>
    </div>
</main>

</body>
</html>