package beans;

public class Salle {
	private int id;
	private String code;
	private String label;
	private String type;
	
	public Salle(int id, String code, String label, String type) {
		this.id = id;
		this.code = code;
		this.type = type;
		this.label = label;
	}
	public Salle(String code, String label, String type) {
		this.code = code;
		this.label = label;
		this.type = type;
	}
	
	public int getId() {
		return id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
