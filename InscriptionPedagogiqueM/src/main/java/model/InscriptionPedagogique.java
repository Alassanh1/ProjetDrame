package model;

import jakarta.persistence.*;

@Entity
public class InscriptionPedagogique {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	private Etudiant etudiant;

	@ManyToOne
	private UE ue;

	private boolean validee;

	// Getters & Setters

	public Long getId() {
	    return id;
	}

	public void setId(Long id) {
	    this.id = id;
	}

	public Etudiant getEtudiant() {
	    return etudiant;
	}

	public void setEtudiant(Etudiant etudiant) {
	    this.etudiant = etudiant;
	}

	public UE getUe() {
	    return ue;
	}

	public void setUe(UE ue) {
	    this.ue = ue;
	}

	public boolean isValidee() {
	    return validee;
	}

	public void setValidee(boolean validee) {
	    this.validee = validee;
	}

}