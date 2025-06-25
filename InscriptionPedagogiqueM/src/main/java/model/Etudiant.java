package model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "etudiants")
public class Etudiant {

    @Id
    private String ine;

    private String prenom;
    private String nom;

    private LocalDate dateNaissance;
    private String sexe;
    private String adresse;
    private String email;
    private String filiere;
    private String niveau;
    @ManyToOne
    @JoinColumn(name = "groupe_td_id")
    private Groupe groupeTD;

    @ManyToOne
    @JoinColumn(name = "groupe_tp_id")
    private Groupe groupeTP;

    // ======= Getters and Setters =======

    public String getIne() {
        return ine;
    }

    public void setIne(String ine) {
        this.ine = ine;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(LocalDate dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Groupe getGroupeTD() {
        return groupeTD;
    }

    public void setGroupeTD(Groupe groupeTD) {
        this.groupeTD = groupeTD;
    }

    public Groupe getGroupeTP() {
        return groupeTP;
    }

    public void setGroupeTP(Groupe groupeTP) {
        this.groupeTP = groupeTP;
    }
}
