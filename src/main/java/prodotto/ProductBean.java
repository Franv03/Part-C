package prodotto;

import java.io.Serializable;

/**
 * 
 */
public class ProductBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String Categorie[] = {"Motherboard", "PSU", "RAM", "CPU", "GPU", "Storage" ,"Case", "Acc"};
	
	public ProductBean() {
		this.code = -1;
		this.name = "";
		this.price = -1;
		this.quantity = -1;
		this.category = "";
		this.photo = null;
		this.available = true;
	}
	
	public ProductBean(int code, String name, double price, String category) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.quantity = 1;
		this.setCategory(category);
		this.photo = null;
		this.available = true;
	}
	
	public int getCode() {
		return this.code;
	}
	public String getName() {
		return this.name;
	}
	public double getPrice() {
		return this.price;
	}
	public int getQuantity() {
		return this.quantity;
	}
	public String getCategory() {
		return this.category;
	}
	public String getPhoto() {
		return this.photo;
	}
	public boolean isAvailable() {
		return this.available;
	}
	
	
	

	public void setCode(int code) {
		this.code = code;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public void setCategory(String category) {
	    for (String c : Categorie) {
	        if (category.equals(c)) {
	            this.category = category;
	            break;
	        }
	    }
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}
	
	@Override
	public String toString() {
		return getClass().getName() +
				"[" +
				"ID_Prodotto = " + code + ", nome = " + name + ", prezzo = " + price + ", quantita = " + quantity +", categoria = " + category + ", foto = " + photo + ", disponibile = " + available +
				"]";
	}
	
	private int code;
	private String name;
	private double price;
	private Integer quantity;
	private String category;
	private String photo;
	private boolean available;
	
}
