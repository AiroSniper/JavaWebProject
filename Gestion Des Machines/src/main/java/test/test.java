package test;

import beans.Salle;
import service.SalleService;

public class test {

	public static void main(String[] args) {
		
		SalleService ss = new SalleService();
		 String code = "S1";
		 String label = "SALLE 5";
		 String type = "TP";
		// ss.create(new Salle(code, label, type));
		 
		 ss.delete(ss.findById(11));
		 

	}

}
