package prodotto;

import java.io.Serializable;

public class ProductBean implements Serializable {

    private static final long serialVersionUID = 1L;
    private static final String[] CATEGORIE = {"Motherboard", "PSU", "RAM", "CPU", "GPU", "Storage", "Case", "Acc"};

    private int code;
    private String name;
    private double price;
    private int quantity;  // sempre int per evitare problemi in JSP
    private String category;
    private String photo;
    private boolean available;

    // Costruttore vuoto
    public ProductBean() {
        this.code = -1;
        this.name = "";
        this.price = 0.0;
        this.quantity = 0;
        this.category = "";
        this.photo = null;
        this.available = true;
    }

    // Costruttore con campi principali
    public ProductBean(int code, String name, double price, String category) {
        this.code = code;
        this.name = name;
        this.price = price;
        this.quantity = 1; // default
        setCategory(category);
        this.photo = null;
        this.available = true;
    }

    // GETTER
    public int getCode() { return code; }
    public String getName() { return name; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public String getCategory() { return category; }
    public String getPhoto() { return photo; }
    public boolean isAvailable() { return available; }

    // SETTER
    public void setCode(int code) { this.code = code; }
    public void setName(String name) { this.name = name; }
    public void setPrice(double price) { this.price = price; }
    public void setQuantity(int quantity) { this.quantity = quantity; } // int coerente
    public void setCategory(String category) {
        for (String c : CATEGORIE) {
            if (c.equals(category)) {
                this.category = category;
                return;
            }
        }
        this.category = ""; // fallback se categoria non valida
    }
    public void setPhoto(String photo) { this.photo = photo; }
    public void setAvailable(boolean available) { this.available = available; }

    @Override
    public String toString() {
        return "ProductBean[" +
                "code=" + code +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", category='" + category + '\'' +
                ", photo='" + photo + '\'' +
                ", available=" + available +
                ']';
    }
}