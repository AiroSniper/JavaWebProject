package beans;

public class MachinesBySalle {
	private int nbrMachines;
	private Salle salle;
	public MachinesBySalle(int nbrMachines, Salle salle) {
		super();
		this.nbrMachines = nbrMachines;
		this.salle = salle;
	}
	public int getNbrMachines() {
		return nbrMachines;
	}
	public void setNbrMachines(int nbrMachines) {
		this.nbrMachines = nbrMachines;
	}
	public Salle getSalle() {
		return salle;
	}
	public void setSalle(Salle salle) {
		this.salle = salle;
	}
}
