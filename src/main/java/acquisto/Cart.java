package acquisto;

import prodotto.ProductBean;
import java.util.ArrayList;

public class Cart {
	
	public Cart() {
		products = new ArrayList<ProductBean>();
		count = 0;
	}
	
	public int getCount(){
		return count;
	}
	
	public ArrayList<ProductBean> getProducts() {
		return products;
	}
	
	public void addProduct(ProductBean product) {
		products.add(product);
		count += 1;
	}
	
	public void deleteProduct(ProductBean product) {
		for(ProductBean prod : products) {
			if(prod.getCode() == product.getCode()) {
				products.remove(prod);
				count -= 1;
				break;
			}
		}
 	}


	public void clearCart() {
		products.clear();
		count = 0;
	}
	
	private ArrayList<ProductBean> products;
	private int count;
}
