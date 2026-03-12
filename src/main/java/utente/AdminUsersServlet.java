package utente;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminUser
 */
@WebServlet("/AdminUsers")
public class AdminUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UsersDaoDataSource dao = new UsersDaoDataSource();

        try {
            // Recupera gli utenti dal DAO
            ArrayList<User> utenti = dao.doRetrieveAll(null);

            // Aggiungi un log per il debug
            System.out.println("DEBUG - Utenti trovati: " + utenti.size());

            // Imposta l'attributo utenti per la JSP
            request.setAttribute("utenti", utenti);

            // Forward alla pagina corretta (gestioneAccount.jsp)
            request.getRequestDispatcher("/admin/gestioneAccount.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}