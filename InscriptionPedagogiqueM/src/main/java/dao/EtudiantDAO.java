package dao;

import jakarta.persistence.EntityManager;
import model.Etudiant;

public class EtudiantDAO extends GenericDAO<Etudiant, String> {
	public EtudiantDAO(EntityManager em) {
	    super(em, Etudiant.class);
	}

	public Etudiant findByEmail(String email) {
	    return em.createQuery(
	        "SELECT e FROM Etudiant e WHERE e.email = :email", Etudiant.class)
	        .setParameter("email", email)
	        .getSingleResult();
	}

}