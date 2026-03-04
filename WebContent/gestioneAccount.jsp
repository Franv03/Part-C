<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,utente.User"%>

<%
ArrayList<User> utenti =
(ArrayList<User>) request.getAttribute("utenti");
%>

<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<link href="CSS/style.css" rel="stylesheet">
<title>Gestione Utenti</title>
</head>

<body>

<main class="bgPage">
<div class="container">

<h2 style="text-align:center;">Gestione Utenti</h2>

<%
if(utenti != null && !utenti.isEmpty()){
    for(User u : utenti){
%>

<div class="itemContainer">
    <div class="cart-item">
        <div class="cartRow">

            <!-- Dati utente -->
            <h5><%=u.getNome()%></h5>
            <h5><%=u.getCognome()%></h5>
            <h5><%=u.getEmail()%></h5>
            <h5><%=u.isAdmin() ? "Admin" : "Utente"%></h5>

            <div class="last">
                <div class="dataContainer center-item">

                    <!-- Modifica ruolo -->
                    <a href="javascript:void(0);" 
                       onclick="toggleEditForm('<%=u.getEmail()%>')">
                        ✏️
                    </a>

                    <div id="editForm<%=u.getEmail()%>" 
                         style="display:none; margin-top:5px;">
                        <form action="UpdateUserServlet" method="post">
                            <input type="hidden" name="email" value="<%=u.getEmail()%>">

                            Ruolo:
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

                    <!-- Eliminazione -->
                    <a href="javascript:void(0);" 
                       onclick="toggleDeleteForm('<%=u.getEmail()%>')">
                        🗑️
                    </a>

                    <div id="deleteForm<%=u.getEmail()%>" 
                         style="display:none; margin-top:5px;">
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
function toggleDeleteForm(email) {
    var form = document.getElementById("deleteForm" + email);
    form.style.display = (form.style.display === "block") ? "none" : "block";
}

function toggleEditForm(email) {
    var form = document.getElementById("editForm" + email);
    form.style.display = (form.style.display === "block") ? "none" : "block";
}
</script>

</body>
</html>