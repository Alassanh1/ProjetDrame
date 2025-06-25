package controller;

import dao.EtudiantDAO;
import dao.UEDAO;
import model.Etudiant;
import model.UE;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/InscriptionPedagogiqueServlet")
public class InscriptionPedagogiqueServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String naissance = request.getParameter("naissance");
        String sexe = request.getParameter("sexe");
        String adresse = request.getParameter("adresse");
        String email = request.getParameter("email");
        String filiere = request.getParameter("filiere");
        String niveau = request.getParameter("niveau");

        String[] uesCodes = request.getParameterValues("ues");

        // Créer l'étudiant
        Etudiant etu = new Etudiant();
        etu.setNom(nom);
        etu.setPrenom(prenom);
        etu.setDateNaissance(naissance);
        etu.setSexe(sexe);
        etu.setAdresse(adresse);
        etu.setEmail(email);
        etu.setFiliere(filiere);
        etu.setNiveau(niveau);

        // Enregistrer l'étudiant
        EtudiantDAO dao = new EtudiantDAO();
        int idEtudiant = dao.ajouterEtudiantEtRetourId(etu);

        // Enregistrer les UEs choisies (relation many-to-many)
        if (uesCodes != null) {
            UEdao uedao = new UEDAO();
            for (String code : uesCodes) {
                UE ue = uedao.getUEByCode(code);
                dao.ajouterUEEtudiant(idEtudiant, ue.getId());
            }
        }

        // Afficher page de confirmation
        request.getRequestDispatcher("confirmation.jsp").forward(request, response);
    }
}
