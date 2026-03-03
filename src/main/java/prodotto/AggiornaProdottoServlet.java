package prodotto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AggiornaProdottoServlet
 */
@WebServlet("/AggiornaProdottoServlet")
public class AggiornaProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaProdottoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    try {
	        int id = Integer.parseInt(request.getParameter("id"));          
	        double price = Double.parseDouble(request.getParameter("price")); 

	        // Gestione sicura della disponibilità
	        String availableParam = request.getParameter("available");
	        boolean available = true; // default se non arriva nulla
	        if (availableParam != null) {
	            available = "1".equals(availableParam);
	        }

	        ProductDaoDataSource dao = new ProductDaoDataSource();
	        ProductBean p = dao.doRetrieveByKey(id); 

	        if (p != null) {
	            p.setPrice(price);
	            p.setAvailable(available);
	            dao.doUpdate(p); // aggiorna prezzo e disponibilità
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    response.sendRedirect(request.getContextPath() + "/Admin");
	}

}
