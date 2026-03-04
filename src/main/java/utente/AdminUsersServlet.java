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
            ArrayList<User> utenti = dao.doRetrieveAll(null);
            request.setAttribute("utenti", utenti);
            request.getRequestDispatcher("/adminUsers.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}