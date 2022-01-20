package beans;

public class MachinesByMarkes {
	private int nbrMachines;
	private String marque;
	public MachinesByMarkes(int nbrMachines, String marque) {
		super();
		this.nbrMachines = nbrMachines;
		this.marque = marque;
	}
	public int getNbrMachines() {
		return nbrMachines;
	}
	public void setNbrMachines(int nbrMachines) {
		this.nbrMachines = nbrMachines;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	
	

}
