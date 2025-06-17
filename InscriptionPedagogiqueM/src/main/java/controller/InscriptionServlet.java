package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import jakarta.persistence.*;
import java.io.IOException;
import dao.UtilisateurDAO;
import model.Role;
import model.Utilisateur;

@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("InscriptionPU");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO(em);

        try {
            tx.begin();

            Utilisateur user = new Utilisateur();
            user.setLogin(login);
            user.setMotDePasse(password);
            user.setEmail(email);
            user.setRole(Role.ETUDIANT);

            utilisateurDAO.create(user);

            tx.commit();
            response.sendRedirect(request.getContextPath() + "/vue/login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            if (tx.isActive()) tx.rollback();
            request.setAttribute("error", "Erreur lors de l'inscription.");
            request.getRequestDispatcher("/vue/inscription.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        if (emf != null) emf.close();
    }
}
