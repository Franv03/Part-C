package prodotto;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Admin")
public class AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDaoDataSource productDAO;

    @Override
    public void init() throws ServletException {
    	productDAO = new ProductDaoDataSource();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<ProductBean> prodotti = new ArrayList<>();

        try {
            prodotti = productDAO.doRetrieveAll(null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Metto la lista nella REQUEST (non nella sessione!)
        request.setAttribute("prodotti", prodotti);

        // Forward alla pagina admin.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);
    }
}