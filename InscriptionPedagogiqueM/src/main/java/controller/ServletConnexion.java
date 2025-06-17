package controller;

import dao.UtilisateurDAO;
import jakarta.persistence.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Role;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/connexion")
public class ServletConnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EntityManagerFactory emf;

	@Override
	public void init() {
	    emf = Persistence.createEntityManagerFactory("InscriptionPU");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String login = request.getParameter("login");
	    String password = request.getParameter("password");

	    EntityManager em = emf.createEntityManager();
	    UtilisateurDAO utilisateurDAO = new UtilisateurDAO(em);

	    try {
	        Utilisateur utilisateur = utilisateurDAO.findByLogin(login);

	        if (utilisateur != null && utilisateur.getMotDePasse().equals(password)) {
	            HttpSession session = request.getSession();
	            session.setAttribute("utilisateur", utilisateur);

	            if (utilisateur.getRole() == Role.ETUDIANT) {
	            	response.sendRedirect(request.getContextPath() + "/vue/etudiant/dashboard.jsp");

	            } else if (utilisateur.getRole() == Role.RESPONSABLE) {
	                response.sendRedirect("responsable/dashboard.jsp");
	            }
	        } else {
	            request.setAttribute("error", "Login ou mot de passe incorrect.");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        }
	    } catch (Exception e) {
	        request.setAttribute("error", "Utilisateur introuvable.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    } finally {
	        em.close();
	    }
	}

	@Override
	public void destroy() {
	    emf.close();
	}

}