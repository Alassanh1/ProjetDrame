package model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Formation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String intitule;
	private String niveau;

	private String responsableNom;
	private String responsableEmail;

	@OneToMany(mappedBy = "formation", cascade = CascadeType.ALL)
	private List<UE> ues;

	// Getters et Setters

	public Long getId() {
	    return id;
	}

	public void setId(Long id) {
	    this.id = id;
	}

	public String getIntitule() {
	    return intitule;
	}

	public void setIntitule(String intitule) {
	    this.intitule = intitule;
	}

	public String getNiveau() {
	    return niveau;
	}

	public void setNiveau(String niveau) {
	    this.niveau = niveau;
	}

	public String getResponsableNom() {
	    return responsableNom;
	}

	public void setResponsableNom(String responsableNom) {
	    this.responsableNom = responsableNom;
	}

	public String getResponsableEmail() {
	    return responsableEmail;
	}

	public void setResponsableEmail(String responsableEmail) {
	    this.responsableEmail = responsableEmail;
	}

	public List<UE> getUes() {
	    return ues;
	}

	public void setUes(List<UE> ues) {
	    this.ues = ues;
	}
}
