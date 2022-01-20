package beans;

public class MachinesParType {

	private int nbrMachines;
	private String type;
	public MachinesParType(int nbrMachines, String type) {
		super();
		this.nbrMachines = nbrMachines;
		this.type = type;
	}
	public int getNbrMachines() {
		return nbrMachines;
	}
	public void setNbrMachines(int nbrMachines) {
		this.nbrMachines = nbrMachines;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
