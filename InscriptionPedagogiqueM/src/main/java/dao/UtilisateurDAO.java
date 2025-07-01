package dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import model.Utilisateur;

public class UtilisateurDAO {
    private EntityManager em;

    public UtilisateurDAO(EntityManager em) {
        this.em = em;
    }

    public Utilisateur findByLogin(String login) {
        try {
            return em.createQuery(
                "SELECT u FROM Utilisateur u WHERE u.login = :login", Utilisateur.class)
                .setParameter("login", login)
                .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }
}
