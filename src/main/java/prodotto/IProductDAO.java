package prodotto;

import java.sql.SQLException;
import java.util.ArrayList;

import utente.User;

public interface IProductDAO<T> {
	
		 public void doSave(T product) throws SQLException;
		 public void doUpdate(T product) throws SQLException;
		 public boolean doRemove(int codice) throws SQLException;
		 public T doRetrieveByKey(int codice) throws SQLException;
		 public ArrayList<T> doRetrieveByName(String nome) throws SQLException;
		 public ArrayList<T> doRetrieveByCategory(String categoria) throws SQLException;
		 public ArrayList<T> doRetrieveAvailable() throws SQLException;
		 public ArrayList<T> doRetrieveAll(String order) throws SQLException;
		 public void doBuy(ArrayList<T> products, User u) throws SQLException;
		 public ArrayList<ProductBean> doRetriveByMinPrice() throws SQLException;
}