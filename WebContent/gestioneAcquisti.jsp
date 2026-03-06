<!DOCTYPE html>
<html lang="it" dir="ltr">
<%@ page import="java.util.ArrayList,acquisto.Ordine,utente.User" %>

<%
User admin = (User) request.getSession().getAttribute("user");

if(admin == null || !admin.isAdmin()){
    response.sendRedirect(request.getContextPath() + "/index.jsp");
    return;
}
	ArrayList<Ordine> ordini =(ArrayList<Ordine>) request.getSession().getAttribute("ordini");
	if(ordini == null){
		response.sendRedirect(request.getContextPath() + "/Ordini");
		return;
	}
%>

<head>
  <link rel="shortcut icon" type="image/gif" href="../img/logo.png">
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale = 1, width = device-width">
  <link id="mystylesheet" rel="stylesheet" type="text/css" href="CSS/style.css">
  <script src="JS/scripts.js"></script>

  <title>Part-C</title>
</head>

<body>
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
				<li><a class="navLink" href="delivery.html">Gestione Acquisti</a></li>
				<li><a class="navIconLink" href="Logout">
					<img class="navIcon" src="img/icons/userLog.png">
				</a></li>
			</ul>
		</div>
	</div>
</header>

</head>

  <main>
    <div class="filterAdmin">
    <a href="Ordini"><input type="text" value="RIMUOVI FILTRO"></a>
      <form id="filterForm" method="POST" action="Ordini">
        <input name="user" id="orderFilter" type="input" placeholder="filter..."/><input type="date" name="start"  value="<%=java.time.LocalDate.now()%>"/><input type="date" name="end" value="<%=java.time.LocalDate.now()%>"/>
        <input id="btnFilter" type=submit value="FILTRA"></input>
      </form>
    </div>
    <table>
	    <tr>
    	  <th colspan="2">E-MAIL</th>
        <th>ID ORDINE</th>
    	  <th>DATA</th>
        <th>QUANTITA'</th>
        <th>PRODOTTO</th>
        <th>TIPO</th>
        <th>COSTO</th>
	    </tr>
	    <%for(Ordine o: ordini){ %>
	    <tr>        
        <td colspan="2"><%=o.getEmail()%></td>
    	  <td><%=o.getID_ordine()%></td>
    	  <td><%=o.getData_acquisto()%></td>
        <td><%=o.getQ_acquisto()%></td>
        <td><%=o.getNome_prodotto()%></td>
        <td><%=o.getCategoria_prodotto()%></td>
        <td><%=o.getPrezzo()%></td>
      </tr>
	    <%} %>
    </table>
  </main>
</body>
</html>