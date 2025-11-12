package prodotto;

import java.sql.Connection;        
import java.sql.Date;              
import java.sql.PreparedStatement; 
import java.sql.ResultSet;         
import java.sql.SQLException;      
import java.sql.Statement;         
import java.util.ArrayList;        
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;       
import javax.naming.InitialContext; 
import javax.naming.NamingException; 
import javax.sql.DataSource;       

import utente.User;               

public class ProductDaoDataSource implements IProductDAO<ProductBean> {

    private static final String TABLE_NAME = "prodotto";
    private static DataSource ds;
    
    //Query
    private String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE codice = ?";
    private String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
    private String deleteSQL = "UPDATE " + TABLE_NAME + " SET disponibile = false WHERE codice = ?";
    private String insertSQL = "INSERT INTO " + TABLE_NAME + " (nome, prezzo, quantita, categoria, foto, disponibile) VALUES (?, ?, ?, ?, ?, ?)";
    private String updateSQL = "UPDATE " + TABLE_NAME + " SET nome=?, prezzo=?, quantita=?, categoria=?, foto=?, disponibile=? WHERE codice=?";
    
    static {
        try {
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            
            ds = (DataSource) envCtx.lookup("jdbc/PartC");
            
        } catch (NamingException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }

 
    // Inserisce un nuovo prodotto nel database
    @Override
    public void doSave(ProductBean product) throws SQLException {
    	Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertNewSQL = "INSERT INTO " + ProductDaoDataSource.TABLE_NAME
                + " (nome, prezzo, quantità, tipo, foto) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertNewSQL);
            preparedStatement.setString(1, product.getNome());
            preparedStatement.setDouble(2, product.getPrezzo());
            preparedStatement.setInt(3, product.getQuantita());
            preparedStatement.setString(4, product.getCategoria());
            preparedStatement.setString(5, product.getFoto());
            preparedStatement.executeUpdate();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
    }
        

    @Override
    public void doUpdate(ProductBean product) throws SQLException {
        // Aggiorna le informazioni di un prodotto esistente
    }

    @Override
    public boolean doRemove(int codice) throws SQLException {
        // Imposta disponibile = false per il prodotto
        return false;
    }

    @Override
    public ProductBean doRetrieveByKey(int codice) throws SQLException {
        // Restituisce un prodotto cercandolo per codice
        return null;
    }

    @Override
    public ArrayList<ProductBean> doRetrieveByName(String nome) throws SQLException {
        // Restituisce tutti i prodotti con nome simile
        return null;
    }

    @Override
    public ArrayList<ProductBean> doRetrieveByCategory(String categoria) throws SQLException {
        // Restituisce tutti i prodotti della stessa categoria
        return null;
    }

    @Override
    public ArrayList<ProductBean> doRetrieveAvailable() throws SQLException {
        // Restituisce solo i prodotti disponibili
        return null;
    }

    @Override
    public ArrayList<ProductBean> doRetrieveAll(String order) throws SQLException {
        // Restituisce tutti i prodotti (con eventuale ordinamento)
        return null;
    }

    @Override
    public void doBuy(ArrayList<ProductBean> products, User u) throws SQLException {
        // Registra un ordine e i prodotti acquistati
    }
}
