package controller;

import dao.UtilisateurDAO;
import jakarta.persistence.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Role;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/connexion")
public class ServletConnexion extends HttpServlet {
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

        EntityManager em = emf.createEntityManager();
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO(em);

        try {
            Utilisateur utilisateur = utilisateurDAO.findByLogin(login);

            if (utilisateur != null && utilisateur.getMotDePasse().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("utilisateur", utilisateur);

                if (utilisateur.getRole() == Role.RESPONSABLE) {
                    response.sendRedirect(request.getContextPath() + "/vue/responsable/dashboardResponsable.jsp");
                } else {
                    request.setAttribute("error", "Accès réservé aux responsables pédagogiques.");
                    request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Login ou mot de passe incorrect.");
                request.getRequestDispatcher("/vue/login.jsp").forward(request, response);
            }
        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        emf.close();
    }
}
