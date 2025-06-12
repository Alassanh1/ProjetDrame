package model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Groupe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int numero;

    @Enumerated(EnumType.STRING)
    private TypeGroupe type; // TD ou TP

    private int tailleMax;

    @OneToMany(mappedBy = "groupeTD")
    private List<Etudiant> etudiantsTD;

    @OneToMany(mappedBy = "groupeTP")
    private List<Etudiant> etudiantsTP;

    // ======= Getters and Setters =======

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public TypeGroupe getType() {
        return type;
    }

    public void setType(TypeGroupe type) {
        this.type = type;
    }

    public int getTailleMax() {
        return tailleMax;
    }

    public void setTailleMax(int tailleMax) {
        this.tailleMax = tailleMax;
    }

    public List<Etudiant> getEtudiantsTD() {
        return etudiantsTD;
    }

    public void setEtudiantsTD(List<Etudiant> etudiantsTD) {
        this.etudiantsTD = etudiantsTD;
    }

    public List<Etudiant> getEtudiantsTP() {
        return etudiantsTP;
    }

    public void setEtudiantsTP(List<Etudiant> etudiantsTP) {
        this.etudiantsTP = etudiantsTP;
    }
}
