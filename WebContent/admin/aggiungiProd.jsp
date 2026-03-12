<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/gif" href="<%=request.getServletContext().getContextPath()%>/img/logo.png">
<meta charset="utf-8">
<meta name="viewport" content="initial-scale = 1, width = device-width">
<link href="../CSS/style.css" rel="stylesheet">
<title>Part-C</title>
</head>

<body class="bgPage">
	<div class="login">
		<div class="loginForm">
			<h2>Aggiungi Prodotto</h2>
			
			<form action="<%=request.getContextPath()%>/Gestione?activity=add" method="POST">
    
    <input type="text" name="name" placeholder="Nome" required>
    
    <input type="number" name="price" placeholder="Prezzo" step="0.01" min="0" required>
    
    <input type="number" name="quantity" placeholder="Quantità" step="1" min="0" required>
    
    <select name="available" required>
        <option value="1">Disponibile</option>
        <option value="0">Non disponibile</option>
    </select>
    
    <select name="category" required>
        <option value="" disabled selected hidden>Categoria</option>
        <option value="CPU">CPU</option>
        <option value="RAM">RAM</option>
        <option value="Motherboard">Motherboard</option>
        <option value="PSU">PSU</option>
        <option value="Case">Case</option>
        <option value="Storage">Storage</option>
    </select>

    <div class="centerBtn">
        <a href="<%=request.getContextPath()%>/Admin" class="btnAction">Annulla</a>
        <button type="submit">Conferma</button>
    </div>
</form>
		</div>
	</div>

	<!-- Collegamento al JS esterno -->
	<script src="<%=request.getServletContext().getContextPath()%>/JS/prodotto.js"></script>

</body>
</html>