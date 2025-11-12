package prodotto;

import java.io.Serializable;

public class ProductBean implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String Categorie[] = {"Scheda madre", "Alimentatore", "Ram", "Processore", "Scheda Video", "Case"};
	
	public ProductBean() {
		this.codice = -1;
		this.nome = "";
		this.prezzo = -1;
		this.quantita = -1;
		this.categoria = "";
		this.foto = null;
		this.disponibile = true;
	}
	
	public int getCodice() {
		return this.codice;
	}
	public String getNome() {
		return this.nome;
	}
	public double getPrezzo() {
		return this.prezzo;
	}
	public int getQuantita() {
		return this.quantita;
	}
	public String getCategoria() {
		return this.categoria;
	}
	public String getFoto() {
		return this.foto;
	}
	public boolean isAvailable() {
		return this.disponibile;
	}
	
	
	
	public void setCodice(int codice) {
		this.codice = codice;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	public void setCategoria(String categoria) {
	    for (String c : Categorie) {
	        if (categoria.equals(c)) {
	            this.categoria = categoria;
	            break;
	        }
	    }
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public void setAvailable(boolean disponibile) {
		this.disponibile = disponibile;
	}
	
	@Override
	public String toString() {
		return getClass().getName() +
				"[" +
				"codice = " + codice + ", nome = " + nome + ", prezzo = " + prezzo + ", quantita = " + quantita +", categoria = " + categoria + ", foto = " + foto + ", disponibile = " + disponibile +
				"]";
	}
	
	private int codice;
	private String nome;
	private double prezzo;
	private Integer quantita;
	private String categoria;
	private String foto;
	private boolean disponibile;
	
}
