package test;

import jakarta.persistence.*;
import model.Etudiant;
import model.Formation;
import model.Groupe;
import model.TypeGroupe;
import model.UE;

import java.time.LocalDate;

public class TestInsertion {
public static void main(String[] args) {
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("InscriptionPU");
    EntityManager em = emf.createEntityManager();

    EntityTransaction tx = em.getTransaction();

    try {
        tx.begin();

        // Créer une formation
        Formation formation = new Formation();
        formation.setIntitule("Licence Informatique");
        formation.setNiveau("L2");
        formation.setResponsableNom("Dr. Khalil");
        formation.setResponsableEmail("khalil@univ.fr");

        em.persist(formation);

        // Créer une UE rattachée à la formation
        UE ue = new UE();
        ue.setCode("INF204");
        ue.setNom("Structures de Données");
        ue.setVolumeHoraire(48);
        ue.setCoefficient(2.0f);
        ue.setCredits(6);
        ue.setObligatoire(true);
        ue.setEnseignantResponsable("Mme Benamara");
        ue.setFormation(formation);

        em.persist(ue);

        // Créer les groupes TD et TP
        Groupe groupeTD = new Groupe();
        groupeTD.setNumero(1);
        groupeTD.setTailleMax(30);
        groupeTD.setType(TypeGroupe.TD);
        em.persist(groupeTD);

        Groupe groupeTP = new Groupe();
        groupeTP.setNumero(2);
        groupeTP.setTailleMax(20);
        groupeTP.setType(TypeGroupe.TP);
        em.persist(groupeTP);

        // Créer un étudiant
        Etudiant etu = new Etudiant();
        etu.setIne("20250001");
        etu.setNom("Ahmed");
        etu.setPrenom("Yacine");
        etu.setAdresse("Rue des étudiants, Alger");
        etu.setEmail("yacine.ahmed@etu.univ.dz");
        etu.setSexe("H");
        etu.setDateNaissance(LocalDate.of(2003, 3, 15));
        etu.setGroupeTD(groupeTD);
        etu.setGroupeTP(groupeTP);

        em.persist(etu);

        tx.commit();
        System.out.println("✅ Insertion terminée avec succès !");

    } catch (Exception e) {
        e.printStackTrace();
        tx.rollback();
    } finally {
        em.close();
        emf.close();
    }
}

}