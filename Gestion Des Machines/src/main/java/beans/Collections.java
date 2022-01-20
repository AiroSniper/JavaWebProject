package beans;

import java.util.List;

public class Collections {
	List<Salle> salles;
	List<Machine> machines;

	public Collections(List<Salle> salles, List<Machine> machines) {
		super();
		this.salles = salles;
		this.machines = machines;
	}

	public List<Salle> getSalles() {
		return salles;
	}

	public void setSalles(List<Salle> salles) {
		this.salles = salles;
	}

	public List<Machine> getMachines() {
		return machines;
	}

	public void setMachines(List<Machine> machines) {
		this.machines = machines;
	}

}
