package acquisto;

import java.sql.Date;

public class Ordine {

	
	
	public int getID_ordine() {
		return ID_ordine;
	}
	
	public Date getData_acquisto() {
		return data_acquisto;
	}
	
	public String getEmail() {
		return email;
	}
	
	public int getQ_acquisto() {
		return q_acquisto;
	}
	
	public String getNome_prodotto() {
		return nome_prodotto;
	}
	
	public String getCategoria_prodotto() {
		return categoria_prodotto;
	}
	
	public double getPrezzo() {
		return prezzo;
	}
	
	
	
	
	public void setID_ordine(int iD_ordine) {
		ID_ordine = iD_ordine;
	}

	public void setData_acquisto(Date data_acquisto) {
		this.data_acquisto = data_acquisto;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setQ_acquisto(int q_acquisto) {
		this.q_acquisto = q_acquisto;
	}

	public void setNome_prodotto(String nome_prodotto) {
		this.nome_prodotto = nome_prodotto;
	}

	public void setCategoria_prodotto(String categoria_prodotto) {
		this.categoria_prodotto = categoria_prodotto;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	
	
	
	
	private int ID_ordine;
	private Date data_acquisto;
	private String email;
	private int q_acquisto;
	private String nome_prodotto;
	private String categoria_prodotto;	//modifica da tipo
	private double prezzo;
}
