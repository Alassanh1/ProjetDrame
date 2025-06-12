package test.DatabaseInit;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class TestConnexion {
	public static void main(String[] args) {
	    EntityManagerFactory emf = Persistence.createEntityManagerFactory("InscriptionPU");
	    emf.close();
	    System.out.println("Connexion OK !");
	}


}
