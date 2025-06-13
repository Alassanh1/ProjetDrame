package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import model.Utilisateur;

class UtilisateurDAO extends GenericDAO<Utilisateur, Long> {
    public UtilisateurDAO(EntityManager em) {
        super(em, Utilisateur.class);
    }

    public Utilisateur findByLogin(String login) {
        Query query = em.createQuery("SELECT u FROM Utilisateur u WHERE u.login = :login", Utilisateur.class);
        query.setParameter("login", login);
        return (Utilisateur) query.getSingleResult();
    }
}