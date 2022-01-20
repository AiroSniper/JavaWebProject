package beans;

public class User {

	private int id;
	private String login;
	private String email;
	private String nom;
	private String prenom;
	private String password;
	private int status;
	private String image;
	
	
	public User(int id, String login, String email, String nom, String prenom, String password, int status, String image) {
		this.id = id;
		this.login = login;
		this.email = email;
		this.nom = nom;
		this.prenom = prenom;
		this.password = password;
		this.status = status;
		this.image = image;
	}
	
	public User(int id, String image) {
		this.id = id;
		this.image = image;
	}
	
	public User(int id, String password, int status) {
		this.id = id;
		this.password = password;
		this.status = status;
		
	}
	
	public User(int id, String password, boolean x) {
		this.id = id;
		this.password = password;
		
		
	}

	public User(int id, String login, String email, String nom, String prenom) {
		this.id = id;
		this.login = login;
		this.email = email;
		this.nom = nom;
		this.prenom = prenom;
	}
	
	public User(String login, String email, String nom, String prenom, String password, int status, String image) {
		this.login = login;
		this.email = email;
		this.nom = nom;
		this.prenom = prenom;
		this.password = password;
		this.status = status;
		this.image = image;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
	
	
}
