package acquisto;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDaoDataSource {

    private static DataSource ds;

    static {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            ds = (DataSource) envCtx.lookup("jdbc/PartC");
        } catch (NamingException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

    // Recupera tutti gli ordini con prodotti
    public ArrayList<Ordine> doRetrieveAllOrders() throws SQLException {
        String query = "SELECT o.ID_ordine, o.data_acquisto, o.email, " +
                       "a.q_acquisto, a.nome_prodotto, a.categoria_prodotto, a.prezzo " +
                       "FROM ordine o INNER JOIN acquisto a ON o.ID_ordine = a.ID_ordine";

        ArrayList<Ordine> ordini = new ArrayList<>();
        try (Connection connection = ds.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Ordine o = new Ordine();
                o.setID_ordine(rs.getInt("ID_ordine"));
                o.setData_acquisto(rs.getDate("data_acquisto"));
                o.setEmail(rs.getString("email"));
                o.setQ_acquisto(rs.getInt("q_acquisto"));
                o.setNome_prodotto(rs.getString("nome_prodotto"));
                o.setCategoria_prodotto(rs.getString("categoria_prodotto"));
                o.setPrezzo(rs.getDouble("prezzo"));
                ordini.add(o);
            }
        }
        return ordini;
    }

    // Recupera ordini filtrati per date
    public ArrayList<Ordine> doRetrieveByDateFilter(String data1, String data2) throws SQLException {
        String query = "SELECT o.ID_ordine, o.data_acquisto, o.email, " +
                       "a.q_acquisto, a.nome_prodotto, a.categoria_prodotto, a.prezzo " +
                       "FROM ordine o INNER JOIN acquisto a ON o.ID_ordine = a.ID_ordine " +
                       "WHERE o.data_acquisto >= ? AND o.data_acquisto <= ?";

        ArrayList<Ordine> ordini = new ArrayList<>();
        try (Connection connection = ds.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, data1);
            ps.setString(2, data2);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ordine o = new Ordine();
                    o.setID_ordine(rs.getInt("ID_ordine"));
                    o.setData_acquisto(rs.getDate("data_acquisto"));
                    o.setEmail(rs.getString("email"));
                    o.setQ_acquisto(rs.getInt("q_acquisto"));
                    o.setNome_prodotto(rs.getString("nome_prodotto"));
                    o.setCategoria_prodotto(rs.getString("categoria_prodotto"));
                    o.setPrezzo(rs.getDouble("prezzo"));
                    ordini.add(o);
                }
            }
        }
        return ordini;
    }

    // Recupera ordini filtrati per email utente
    public ArrayList<Ordine> doRetrieveByNameFilter(String email) throws SQLException {
        String query = "SELECT o.ID_ordine, o.data_acquisto, o.email, " +
                       "a.q_acquisto, a.nome_prodotto, a.categoria_prodotto, a.prezzo " +
                       "FROM ordine o INNER JOIN acquisto a ON o.ID_ordine = a.ID_ordine " +
                       "WHERE o.email = ?";

        ArrayList<Ordine> ordini = new ArrayList<>();
        try (Connection connection = ds.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ordine o = new Ordine();
                    o.setID_ordine(rs.getInt("ID_ordine"));
                    o.setData_acquisto(rs.getDate("data_acquisto"));
                    o.setEmail(rs.getString("email"));
                    o.setQ_acquisto(rs.getInt("q_acquisto"));
                    o.setNome_prodotto(rs.getString("nome_prodotto"));
                    o.setCategoria_prodotto(rs.getString("categoria_prodotto"));
                    o.setPrezzo(rs.getDouble("prezzo"));
                    ordini.add(o);
                }
            }
        }
        return ordini;
    }
}