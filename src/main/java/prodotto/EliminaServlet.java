package prodotto;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EliminaServlet")
public class EliminaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ProductDaoDataSource productDAO;

    @Override
    public void init() throws ServletException {
        // Inizializza il DAO
        productDAO = new ProductDaoDataSource();
    }

    // Metodo comune per gestire GET e POST
    private void eliminaProdotto(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                boolean removed = productDAO.doRemove(id); // rimuove fisicamente il prodotto

                if (!removed) {
                    System.out.println("Prodotto con ID " + id + " non trovato.");
                }
            } catch (NumberFormatException e) {
                System.out.println("ID prodotto non valido: " + idParam);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        // Reindirizza sempre alla pagina Admin dopo l’eliminazione
        response.sendRedirect(request.getContextPath() + "/Admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        eliminaProdotto(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        eliminaProdotto(request, response);
    }
}