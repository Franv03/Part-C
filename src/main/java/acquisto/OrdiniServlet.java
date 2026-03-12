package acquisto;

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

/**
 * Servlet implementation class OrdiniServlet
 */
@WebServlet("/Ordini")
public class OrdiniServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdiniServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDaoDataSource source = new OrderDaoDataSource();
        ArrayList<Ordine> o = new ArrayList<>();

        String nome = request.getParameter("user");
        String data1 = request.getParameter("start");
        String data2 = request.getParameter("end");

        try {
            if ((nome == null || nome.isEmpty()) && (data1 == null || data1.isEmpty()) && (data2 == null || data2.isEmpty())) {
                o = source.doRetrieveAllOrders();
            } else if (nome == null || nome.isEmpty()) {
                System.out.println("OrdiniServlet, chiamando doRetrieveByDateFilter:");
                o = source.doRetrieveByDateFilter(data1, data2);
            } else {
                System.out.println("OrdiniServlet, chiamando doRetrieveByNameFilter:");
                o = source.doRetrieveByNameFilter(nome);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("ordini", o);  // <- importante, deve essere request!
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin/gestioneAcquisti.jsp");
        dispatcher.forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}