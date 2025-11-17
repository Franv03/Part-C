package prodotto;

import java.sql.Connection;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import utente.User;

public class ProductDaoDataSource implements IProductDAO<ProductBean> {

	private static final String TABLE_NAME = "prodotto";
	private static DataSource ds;

	// Query
	private String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE codice = ?";
	private String selectAllSQL = "SELECT * FROM " + TABLE_NAME;
	private String deleteSQL = "UPDATE " + TABLE_NAME + " SET disponibile = false WHERE codice = ?";
	private String insertSQL = "INSERT INTO " + TABLE_NAME
			+ " (nome, prezzo, quantita, categoria, foto, disponibile) VALUES (?, ?, ?, ?, ?, ?)";
	private String updateSQL = "UPDATE " + TABLE_NAME
			+ " SET nome=?, prezzo=?, quantita=?, categoria=?, foto=?, disponibile=? WHERE codice=?";

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

		String updateSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME
				+ " SET nome = ?,quantita = ?, categoria = ?, prezzo = ?, foto = ?";

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
				oldBean.setPrice((float) rs.getDouble("prezzo"));

				preparedStatement = connection.prepareStatement(updateSQL);
				if (product.getName() == null) {
					preparedStatement.setString(1, oldBean.getName());
				} else
					preparedStatement.setString(1, product.getName());

				if (product.getCategory() == null) {
					preparedStatement.setString(1, oldBean.getCategory());
				} else
					preparedStatement.setString(1, product.getCategory());

				if (product.getPrice() < 0) {
					preparedStatement.setDouble(1, oldBean.getPrice());
				} else
					preparedStatement.setDouble(1, product.getPrice());

				if (product.getPhoto() == null) {
					preparedStatement.setString(1, oldBean.getPhoto());
				} else
					preparedStatement.setString(1, product.getPhoto());
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

		String deleteSQL = "UPDATE " + ProductDaoDataSource.TABLE_NAME
				+ " SET disponibile = 'false' WHERE ID_prodotto = ?";

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

		// String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + "
		// WHERE ID_prodotto = ?";

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
				bean.setPrice((float) rs.getDouble("prezzo"));

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
	public ArrayList<ProductBean> doRetrieveByName(String name) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> beanz = new ArrayList<ProductBean>();

		String selectNameSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE nome LIKE ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectNameSQL);
			preparedStatement.setString(1, "%" + name + "%");

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("ID_prodotto"));
				bean.setName(rs.getString("nome"));
				bean.setCategory(rs.getString("categoria"));
				bean.setPhoto(rs.getString("foto"));
				bean.setPrice((float) rs.getDouble("prezzo"));
				beanz.add(bean);

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
		return beanz;
	}


	// Cerca prodotto per categoria
	@Override
	public ArrayList<ProductBean> doRetrieveByCategory(String categoria) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> beanz = new ArrayList<ProductBean>();

		String selectNameSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE categoria = ?";

		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectNameSQL);
			preparedStatement.setString(1, categoria);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();
				bean.setCode(rs.getInt("ID_prodotto"));
				bean.setName(rs.getString("nome"));
				bean.setCategory(rs.getString("categoria"));
				bean.setPhoto(rs.getString("foto"));
				bean.setPrice((float)rs.getDouble("prezzo"));
				beanz.add(bean);
			
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
		return beanz;
	}


	// Prodotti disponibili
	@Override
	public synchronized ArrayList<ProductBean> doRetrieveAvailable() throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME + " WHERE disponibile = TRUE";
		connection = ds.getConnection();
		try {

			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				bean.setQuantity(rs.getInt("quantita"));
				bean.setCategory(rs.getString("categoria"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getFloat("prezzo"));
				bean.setPhoto(rs.getString("foto"));
				bean.setAvailable(rs.getBoolean("disponibile"));

				products.add(bean);
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
		return products;
	}

	// Tutti i prodotti
	@Override
	public ArrayList<ProductBean> doRetrieveAll(String order) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		ArrayList<ProductBean> products = new ArrayList<ProductBean>();

		String selectSQL = "SELECT * FROM " + ProductDaoDataSource.TABLE_NAME;
		connection = ds.getConnection();
		try {
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY ?";
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, order);
		}else {
			preparedStatement = connection.prepareStatement(selectSQL);
		}

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean bean = new ProductBean();

				
				bean.setCategory(rs.getString("categoria"));
				bean.setName(rs.getString("nome"));
				bean.setPrice(rs.getFloat("prezzo"));
				bean.setPhoto(rs.getString("foto"));
				bean.setAvailable(rs.getBoolean("disponibile"));
				
				products.add(bean);
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
		return products;
	}

	// Registra un ordine e i prodotti acquistati
	@Override
	public void doBuy(ArrayList<ProductBean> products, User u) throws SQLException {
		String Ordinesql = "INSERT INTO ordine(data_acquisto, email) VALUES(?,?)";
		String Prodottisql = "INSERT INTO acquisto(ID_ordine,q_acquisto,nome,tipo,prezzo) VALUES(?,?,?,?,?)";
		
		ArrayList<ProductBean> catalogati = new ArrayList<ProductBean>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		connection = ds.getConnection();
		try {
			//creo l'ordine
			preparedStatement = connection.prepareStatement(Ordinesql,Statement.RETURN_GENERATED_KEYS);
			preparedStatement.setDate(1, Date.valueOf(java.time.LocalDate.now()));
			preparedStatement.setString(2, u.getEmail());
			preparedStatement.execute();
			ResultSet id = preparedStatement.getGeneratedKeys();
			int generatedId = -1;
			if (id.next()) {generatedId = id.getInt(1); }
			else System.out.println("ProductDaoDataSource + ERRORE KEY");
			System.out.println("ProductDaoDataSource: Ordine eseguito +" + generatedId);
			preparedStatement.close();
					
			//aggiungo i prodotti acquistati all'ordine
			preparedStatement = connection.prepareStatement(Prodottisql);
			preparedStatement.setInt(1, generatedId);
			
			for(ProductBean p: products) {
				String currentProduct = p.getName();
				System.out.println("ProductDaoDataSource: PRECatalogati +" + p.getName());
				if(!catalogati.contains(p)) {
					catalogati.add(p);
					System.out.println("ProductDaoDataSource: Catalogati +" + p.getName());
					int i = 0; 
					for(ProductBean f: products) if(f.getName().equals(currentProduct))i++;
					System.out.println("ProductDaoDataSource: i + " +i);
					preparedStatement.setInt(2, i);
					preparedStatement.setString(3, currentProduct);
					preparedStatement.setString(4, p.getCategory());
					preparedStatement.setDouble(5, (p.getPrice()*i));
					preparedStatement.addBatch();
				}
			}
			preparedStatement.executeBatch();
			System.out.println("ProductDaoDataSource: Batch ORdine eseguita");
			
			
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		
	}


	// Restituisce per ogni categoria il prodotto con il prezzo min (LIMIT 3)
	@Override
	public ArrayList<ProductBean> doRetriveByMinPrice() throws SQLException {
		String query = "SELECT * " + "FROM " + ProductDaoDataSource.TABLE_NAME
				+ " JOIN (SELECT categoria, MIN(prezzo) AS prezzo_min " + "FROM " + ProductDaoDataSource.TABLE_NAME
				+ " GROUP BY categoria) " + "m ON " + ProductDaoDataSource.TABLE_NAME + ".categoria = m.categoria AND "
				+ ProductDaoDataSource.TABLE_NAME + ".prezzo = m.prezzo_min " + "ORDER BY "
				+ ProductDaoDataSource.TABLE_NAME + ".prezzo ASC " + "LIMIT 3";

		ArrayList<ProductBean> products = new ArrayList<>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(query);
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ProductBean p = new ProductBean();

				p.setCode(rs.getInt("ID_prodotto"));
				p.setName(rs.getString("nome"));
				p.setCategory(rs.getString("categoria"));
				p.setPhoto(rs.getString("foto"));
				p.setPrice((float) rs.getDouble("prezzo"));
				products.add(p);
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

		return products;
	}

}
