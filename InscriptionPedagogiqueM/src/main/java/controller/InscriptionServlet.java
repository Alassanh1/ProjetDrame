package controller;

import dao.UtilisateurDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Utilisateur;

import java.io.IOException;

@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String motdepasse = request.getParameter("motdepasse");

        Utilisateur utilisateur = new Utilisateur();
        utilisateur.setEmail(email);
        utilisateur.setMotdepasse(motdepasse); // à crypter dans la version finale
        utilisateur.setRole("etudiant");

        UtilisateurDAO dao = new UtilisateurDAO();
        dao.ajouterUtilisateur(utilisateur);

        // Redirige vers le login après inscription
        response.sendRedirect("login.jsp");
    }
}
