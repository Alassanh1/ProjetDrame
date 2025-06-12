package model;

import jakarta.persistence.*;

@Entity
public class UE {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String code;
	private String nom;
	private int volumeHoraire;
	private double coefficient;
	private int credits;

	private String enseignantResponsable;

	private boolean obligatoire; // true = obligatoire, false = optionnelle

	@ManyToOne
	@JoinColumn(name = "formation_id")
	private Formation formation;

	// Getters & Setters

	public Long getId() {
	    return id;
	}

	public void setId(Long id) {
	    this.id = id;
	}

	public String getCode() {
	    return code;
	}

	public void setCode(String code) {
	    this.code = code;
	}

	public String getNom() {
	    return nom;
	}

	public void setNom(String nom) {
	    this.nom = nom;
	}

	public int getVolumeHoraire() {
	    return volumeHoraire;
	}

	public void setVolumeHoraire(int volumeHoraire) {
	    this.volumeHoraire = volumeHoraire;
	}

	public double getCoefficient() {
	    return coefficient;
	}

	public void setCoefficient(double coefficient) {
	    this.coefficient = coefficient;
	}

	public int getCredits() {
	    return credits;
	}

	public void setCredits(int credits) {
	    this.credits = credits;
	}

	public String getEnseignantResponsable() {
	    return enseignantResponsable;
	}

	public void setEnseignantResponsable(String enseignantResponsable) {
	    this.enseignantResponsable = enseignantResponsable;
	}

	public boolean isObligatoire() {
	    return obligatoire;
	}

	public void setObligatoire(boolean obligatoire) {
	    this.obligatoire = obligatoire;
	}

	public Formation getFormation() {
	    return formation;
	}

	public void setFormation(Formation formation) {
	    this.formation = formation;
	}

}