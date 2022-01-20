package beans;

import java.util.Date;

public class Machine {

    private int id;
    private Salle salle;
    private String reference;
    private String marque;
	private Date dateAchat;
    private double prix;
   

    public Machine(int id,Salle salle, String reference,String marque, Date dateAchat, double prix) {
        super();
        this.id = id;
        this.salle = salle;
        this.reference = reference;
        this.marque =marque;
        this.dateAchat = dateAchat;
        this.prix = prix;
        
    }

    public Machine(Salle salle,String reference, String marque, Date dateAchat, double prix) {
        super();
        this.salle = salle;
        this.reference = reference;
        this.marque = marque;
        this.dateAchat = dateAchat;
        this.prix = prix;
        
    }

    
    public void setSalle(Salle salle) {
        this.salle = salle;
    }
    
    public Salle getSalle() {
        return this.salle;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }
    public String getMarque() {
		return marque;
	}

	public void setMarque(String marque) {
		this.marque = marque;
	}

    public Date getDateAchat() {
        return dateAchat;
    }

    public void setDateAchat(Date dateAchat) {
        this.dateAchat = dateAchat;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    @Override
    public String toString() {
        return this.id + " " + this.reference;
    }

}
