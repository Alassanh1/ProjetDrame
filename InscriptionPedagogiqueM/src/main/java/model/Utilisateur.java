package model;

import jakarta.persistence.*;

@Entity
public class Utilisateur {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String login;
	private String motDePasse;

	@Enumerated(EnumType.STRING)
	private Role role; // ETUDIANT ou RESPONSABLE

	// Getters & Setters

	public Long getId() {
	    return id;
	}

	public void setId(Long id) {
	    this.id = id;
	}

	public String getLogin() {
	    return login;
	}

	public void setLogin(String login) {
	    this.login = login;
	}

	public String getMotDePasse() {
	    return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
	    this.motDePasse = motDePasse;
	}

	public Role getRole() {
	    return role;
	}

	public void setRole(Role role) {
	    this.role = role;
	}

}