<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="utente.User,prodotto.ProductBean"%> <!-- CARRELLO!!!!!!!!!!!!!!!!!!!!!!!!!!! -->  
 
<%
	User user = (User)session.getAttribute("user");
	//User user = new User();
	//user.setAdmin(false);
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="JS/scripts.js"></script>
<title>Insert title here</title>
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

			<div class="searchContainer">
				<div class="searchInput">
					<img id="searchIcon" src="img/icons/lens.svg" onclick="Ricerca()">
					<input type="text" id="input" name="searchBox" placeholder="Search...">
				</div>
			</div>

			<div class="centerPosition">
				<ul class="NavbarSub">
					<li><a class="navLink" href="index.jsp">Home</a></li>
					<li><a class="navLink" href="shop.jsp">Shop</a></li>
					<%if(user == null){%>
						<li><a class="navIconLink" href="login.jsp"><img class="navIcon" src="img/icons/userUn.png"></a></li>
						
					<%}else if(user != null && !user.isAdmin()){%>
						<li><a class="navIconLink" href="Logout"><img class="navIcon" src="img/icons/userLog.png"></a></li>
						
					<%}else if(user != null && user.isAdmin()){%>
						<li><a class="navIconLink" href="Logout"><img class="navIcon" src="img/icons/userLog.png"></a></li>
						<li><a class="navIconLink" href="#"><img class="navIcon" src="img/icons/admin.svg"></a></li>
					<%}%>
					<li><a class="navIconLink" href="cart.html"><img class="navIcon" src="img/icons/cart.svg"></a></li>
				</ul>
			</div>
		</div>
	</header>

</body>
</html>