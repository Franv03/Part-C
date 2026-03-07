<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,utente.User"%>

<%
ArrayList<User> utenti =
(ArrayList<User>) request.getAttribute("utenti");
%>

<!DOCTYPE html>
<html lang="it">

<head>
<meta charset="UTF-8">
<link href="CSS/style.css" rel="stylesheet">
<link rel="icon" type="image/svg+xml" href="img/logo/logo.svg">
<title>Gestione Utenti</title>

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
<div class="container">

<h2 style="text-align:center;">Gestione Utenti</h2>

<%
if(utenti != null && !utenti.isEmpty()){
    for(User u : utenti){

        String safeId = u.getEmail().replaceAll("[^a-zA-Z0-9]", "");
%>

<div class="itemContainer">
<div class="cart-item">
<div class="cartRow">

    <!-- Icona utente -->
    <div class="imgContainer center-item">
        <img src="img/icons/user.png" class="removeItem">
    </div>

    <!-- Dati utente -->
    <h5><%=u.getNome()%></h5>
    <h5><%=u.getCognome()%></h5>
    <h5><%=u.getEmail()%></h5>
    <h5><%=u.isAdmin() ? "Admin" : "Utente"%></h5>

    <!-- Azioni -->
    <div class="last">
        <div class="dataContainer center-item">

            <!-- Modifica -->
            <a href="javascript:void(0);" 
               onclick="toggleEdit('<%=safeId%>')">
                <img src="img/icons/pencil.png" class="removeItem">
            </a>

            <div id="edit<%=safeId%>" 
                 class="editForm" 
                 style="display:none;">

                <form action="UpdateUserServlet" method="post">
                    <input type="hidden" name="email" value="<%=u.getEmail()%>">

                    <select name="admin">
                        <option value="true" <%=u.isAdmin() ? "selected":""%>>
                            Admin
                        </option>
                        <option value="false" <%=!u.isAdmin() ? "selected":""%>>
                            Utente
                        </option>
                    </select>

                    <button type="submit">Salva</button>
                </form>
            </div>

            <!-- Elimina -->
            <a href="javascript:void(0);" 
               onclick="toggleDelete('<%=safeId%>')">
                <img src="img/icons/iconTrash.png" class="removeItem">
            </a>

            <div id="delete<%=safeId%>" 
                 class="editForm" 
                 style="display:none;">

                <form action="DeleteUserServlet" method="post">
                    <input type="hidden" name="email" value="<%=u.getEmail()%>">
                    Sei sicuro?
                    <button type="submit">Sì</button>
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
<p style="text-align:center;">Nessun utente trovato</p>
<%
}
%>

</div>
</main>

<script>
function toggleEdit(id) {
    var div = document.getElementById("edit" + id);
    div.style.display = (div.style.display === "block") ? "none" : "block";
}

function toggleDelete(id) {
    var div = document.getElementById("delete" + id);
    div.style.display = (div.style.display === "block") ? "none" : "block";
}
</script>

</body>
</html>