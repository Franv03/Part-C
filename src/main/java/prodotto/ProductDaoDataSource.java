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

 
    // Aggiunta prodotto
    @Override
    public void doSave(ProductBean product) throws SQLException {
    	Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertNewSQL = "INSERT INTO " + ProductDaoDataSource.TABLE_NAME
                + " (nome, prezzo, quantita, categoria, foto) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = ds.getConnection();
            preparedStatement = connection.prepareStatement(insertNewSQL);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setInt(3, product.getQuantity());
            preparedStatement.setString(4, product.getCategory());
            preparedStatement.setString(5, product.getPhoto());
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
        

    // Aggiorna prodotto
    @Override
    public void doUpdate(ProductBean product) throws SQLException {
    	Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean oldBean = new ProductBean();

		String updateSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME + 
		" SET nome = ?,quantita = ?, categoria = ?, prezzo = ?, foto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, product.getCode());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				oldBean.setCode(rs.getInt("ID_prodotto"));
				oldBean.setName(rs.getString("nome"));
				oldBean.setCategory(rs.getString("categoria"));
				oldBean.setPhoto(rs.getString("foto"));
				oldBean.setPrice((float)rs.getDouble("prezzo"));
				
				
			preparedStatement = connection.prepareStatement(updateSQL);
			if(product.getName()== null) {preparedStatement.setString(1, oldBean.getName());}
			else preparedStatement.setString(1, product.getName());
			
			if(product.getCategory()== null) {preparedStatement.setString(1, oldBean.getCategory());}
			else preparedStatement.setString(1, product.getCategory());
			
			if(product.getPrice()< 0) {preparedStatement.setDouble(1, oldBean.getPrice());}
			else preparedStatement.setDouble(1, product.getPrice());
			
			if(product.getPhoto()== null) {preparedStatement.setString(1, oldBean.getPhoto());}
			else preparedStatement.setString(1, product.getPhoto());
			}

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

    // Rimozione prodotto
    @Override
    public boolean doRemove(int code) throws SQLException {
    	Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME + " SET disponibile = 'false' WHERE ID_prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}


    // Cerca prodotto per codice
    @Override
    public ProductBean doRetrieveByKey(int code) throws SQLException {
    	Connection connection = null;
		PreparedStatement preparedStatement = null;

		ProductBean bean = new ProductBean();

		//String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE ID_prodotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCode(rs.getInt("ID_prodotto"));
				bean.setName(rs.getString("nome"));
				bean.setCategory(rs.getString("categoria"));
				bean.setPhoto(rs.getString("foto"));
				bean.setPrice((float)rs.getDouble("prezzo"));
			
			
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
      
    }

    // Cerca prodotto per nome
    @Override
    public ArrayList<ProductBean> doRetrieveByName(String nome) throws SQLException {
        
        return null;
    }

    // Cerca prodotto per categoria
    @Override
    public ArrayList<ProductBean> doRetrieveByCategory(String categoria) throws SQLException {
        
        return null;
    }

    //Prodotti disponibili
    @Override
    public ArrayList<ProductBean> doRetrieveAvailable() throws SQLException {
        
        return null;
    }

    // Tutti i prodotti
    @Override
    public ArrayList<ProductBean> doRetrieveAll(String order) throws SQLException {
        
        return null;
    }

    @Override
    public void doBuy(ArrayList<ProductBean> products, User u) throws SQLException {
        // Registra un ordine e i prodotti acquistati
    }
}
