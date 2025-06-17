package dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import model.Etudiant;
import model.InscriptionPedagogique;
import model.UE;

public class InscriptionPedagogiqueDAO extends GenericDAO<InscriptionPedagogique, Long> {
    public InscriptionPedagogiqueDAO(EntityManager em) {
        super(em, InscriptionPedagogique.class);
    }

    public List<InscriptionPedagogique> findByEtudiant(Etudiant etudiant) {
        return em.createQuery("SELECT i FROM InscriptionPedagogique i WHERE i.etudiant = :etudiant", InscriptionPedagogique.class)
                 .setParameter("etudiant", etudiant)
                 .getResultList();
    }

    public List<InscriptionPedagogique> findByUe(UE ue) {
        return em.createQuery("SELECT i FROM InscriptionPedagogique i WHERE i.ue = :ue", InscriptionPedagogique.class)
                 .setParameter("ue", ue)
                 .getResultList();
    }
}
