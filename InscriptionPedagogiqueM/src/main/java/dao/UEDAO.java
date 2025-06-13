package dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import model.Formation;
import model.UE;

class UEDAO extends GenericDAO<UE, Long> {
    public UEDAO(EntityManager em) {
        super(em, UE.class);
    }

    public List<UE> findByFormation(Formation formation) {
        return em.createQuery("SELECT u FROM UE u WHERE u.formation = :formation", UE.class)
                 .setParameter("formation", formation)
                 .getResultList();
    }
}
