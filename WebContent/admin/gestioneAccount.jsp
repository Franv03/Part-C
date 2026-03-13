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
			</ul>
		</div>
	</div>
</header>

</head>

<body>

<main>
<div class="bg">
<div class="container">

<h2 class="myh2">Gestione Utenti</h2>

<%
if(utenti != null && !utenti.isEmpty()){
    for(User u : utenti){

        String safeId = u.getEmail().replaceAll("[^a-zA-Z0-9]", "");
%>

<div class="itemContainer">
<div class="cart-item">
<div class="cartRow">

    

	<h5><%=u.isAdmin() ? "Admin" : "Utente"%></h5>
    <h5><%=u.getNome()%></h5>
    <h5><%=u.getCognome()%></h5>
    <h5><%=u.getEmail()%></h5>
    

    <!-- Azioni -->
    <div class="last">
        <div class="dataContainer center-item">

           <!-- Modifica -->
<a href="javascript:void(0);" class="modifyBtn"
   onclick="openEditPopup('<%=u.getEmail()%>', '<%=u.isAdmin()%>')">
    <img src="img/icons/pencil.png" class="removeItem">
</a>

           <!-- Elimina -->
<a href="javascript:void(0);" class="modifyBtn"
   onclick="openDeletePopup('<%=u.getEmail()%>')">
    <img src="img/icons/iconTrash.png" class="removeItem">
</a>

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

<script src="JS/users.js"></script>

<div class="popup-overlay" id="editPopupOverlay">
    <div class="popup">

        <a class="close" onclick="closeEditPopup()">x</a>

        <div class="popup-content">

            <h3>Modifica ruolo utente</h3>

            <form action="UpdateUserServlet" method="post">

                <input type="hidden" name="email" id="editEmail">

                <select name="admin" id="editAdmin">
                    <option value="true">Admin</option>
                    <option value="false">Utente</option>
                </select>

                <br><br>

                <button class="btnActionDelete" type="submit">Salva</button>

            </form>

        </div>
    </div>
</div>

<div class="popup-overlay" id="deletePopupOverlay">
    <div class="popup">

        <a class="close" onclick="closeDeletePopup()">x</a>

        <div class="popup-content">

            <h3>Sei sicuro di eliminare questo utente?</h3>

            <form action="DeleteUserServlet" method="post">
                <input type="hidden" name="email" id="deleteEmail">
                <button type="submit" class="btnActionDelete">Sì</button>
                <button type="button" class="popup-content button" onclick="closeDeletePopup()">Annulla</button>
            </form>

        </div>
    </div>
</div>
</body>
</html>