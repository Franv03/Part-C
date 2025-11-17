package acquisto;

import java.io.IOException;
import java.sql.SQLException;

import prodotto.ProductBean;
import prodotto.ProductDaoDataSource;
import utente.User;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Checkout")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDaoDataSource source = new ProductDaoDataSource();
		HttpSession sessione = request.getSession();
		User utente = (User) sessione.getAttribute("user");

		if (utente == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		
		Cart c = (Cart) sessione.getAttribute("cart");
		ArrayList<ProductBean> prodotti = c.getProducts();

		try {
			source.doBuy(prodotti, utente);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		c.clearCart();
		sessione.setAttribute("cart", c);
		sessione.setAttribute("user", utente);

		response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}