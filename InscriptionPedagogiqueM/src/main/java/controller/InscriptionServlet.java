package controller;

import dao.UtilisateurDAO;
import jakarta.persistence.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Role;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {
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
	    String email = request.getParameter("email");

	    EntityManager em = emf.createEntityManager();
	    UtilisateurDAO utilisateurDAO = new UtilisateurDAO(em);

	    try {
	        // Vérifie si un utilisateur avec ce login existe déjà
	        TypedQuery<Utilisateur> query = em.createQuery(
	            "SELECT u FROM Utilisateur u WHERE u.login = :login", Utilisateur.class);
	        query.setParameter("login", login);

	        if (!query.getResultList().isEmpty()) {
	            request.setAttribute("error", "Ce nom d'utilisateur existe déjà.");
	            request.getRequestDispatcher("inscription.jsp").forward(request, response);
	            return;
	        }

	        em.getTransaction().begin();

	        Utilisateur etudiant = new Utilisateur();
	        etudiant.setLogin(login);
	        etudiant.setMotDePasse(password);
	        etudiant.setRole(Role.ETUDIANT);
	        etudiant.setEmail(email); // si tu as ajouté ce champ dans Utilisateur

	        utilisateurDAO.create(etudiant);

	        em.getTransaction().commit();

	        // Rediriger vers la page de connexion après succès
	        response.sendRedirect("login.jsp");

	    } catch (Exception e) {
	        e.printStackTrace();
	        em.getTransaction().rollback();
	        request.setAttribute("error", "Erreur lors de l'inscription.");
	        request.getRequestDispatcher("inscription.jsp").forward(request, response);
	    } finally {
	        em.close();
	    }
	}

	@Override
	public void destroy() {
	    emf.close();
	}

}