package dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import model.Groupe;
import model.TypeGroupe;

class GroupeDAO extends GenericDAO<Groupe, Long> {
    public GroupeDAO(EntityManager em) {
        super(em, Groupe.class);
    }

    public List<Groupe> findByType(TypeGroupe type) {
        return em.createQuery("SELECT g FROM Groupe g WHERE g.type = :type", Groupe.class)
                 .setParameter("type", type)
                 .getResultList();
    }
}