package prodotto;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import utente.User;

@WebServlet("/Gestione")
public class AggiungiProdotti extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User u = (User) request.getSession().getAttribute("user");
        if (u == null || !u.isAdmin()) {
            response.sendRedirect("index.jsp");
            return;
        }

        String activity = request.getParameter("activity");
        ProductDaoDataSource source = new ProductDaoDataSource();

        try {

            if ("add".equals(activity)) {

                ProductBean prodotto = new ProductBean();

                prodotto.setName(request.getParameter("name"));
                prodotto.setCategory(request.getParameter("category"));

                String prezzoStr = request.getParameter("price");
                if (prezzoStr != null && !prezzoStr.isEmpty()) {
                    prodotto.setPrice(Double.parseDouble(prezzoStr));
                }

                String quantitaStr = request.getParameter("quantity");
                if (quantitaStr != null && !quantitaStr.isEmpty()) {
                    prodotto.setQuantity(Integer.parseInt(quantitaStr));
                }

                String disponibileStr = request.getParameter("available");
                prodotto.setAvailable("1".equals(disponibileStr));

                source.doSave(prodotto);
            }

            else if ("modify".equals(activity)) {

                int id = Integer.parseInt(request.getParameter("id"));
                ProductBean prodotto = source.doRetrieveByKey(id);

                String nome = request.getParameter("name");
                if (nome != null && !nome.isEmpty())
                    prodotto.setName(nome);

                String categoria = request.getParameter("category");
                if (categoria != null)
                    prodotto.setCategory(categoria);

                String prezzoStr = request.getParameter("price");
                if (prezzoStr != null && !prezzoStr.isEmpty())
                    prodotto.setPrice(Double.parseDouble(prezzoStr));

                String quantitaStr = request.getParameter("quantity");
                if (quantitaStr != null && !quantitaStr.isEmpty())
                    prodotto.setQuantity(Integer.parseInt(quantitaStr));

                String disponibileStr = request.getParameter("available");
                if (disponibileStr != null)
                    prodotto.setAvailable("1".equals(disponibileStr));

                source.doUpdate(prodotto);
            }

            else if ("remove".equals(activity)) {

                int id = Integer.parseInt(request.getParameter("id"));
                source.doRemove(id);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("Admin");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}