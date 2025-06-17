package controller;

import dao.InscriptionPedagogiqueDAO;
import dao.UEDAO;
import jakarta.persistence.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;

@WebServlet("/inscription-ue")
public class InscriptionUeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
	private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("InscriptionPU");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");

        if (utilisateur == null || utilisateur.getRole() != Role.ETUDIANT) {
        	response.sendRedirect(request.getContextPath() + "/vue/login.jsp");
            return;
        }

        String ueIdStr = request.getParameter("ueId");

        if (ueIdStr == null) {
            request.setAttribute("error", "Aucune UE sélectionnée.");
            request.getRequestDispatcher("/vue/inscrireUE.jsp").forward(request, response);

            return;
        }

        EntityManager em = emf.createEntityManager();
        InscriptionPedagogiqueDAO inscriptionDAO = new InscriptionPedagogiqueDAO(em);
        UEDAO ueDAO = new UEDAO(em);

        try {
            Long ueId = Long.parseLong(ueIdStr);
            UE ue = ueDAO.find(ueId);

            if (ue == null) {
                request.setAttribute("error", "UE introuvable.");
                request.getRequestDispatcher("/vue/inscrireUE.jsp").forward(request, response);

                return;
            }

            Etudiant etudiant = em.find(Etudiant.class, utilisateur.getLogin());

            em.getTransaction().begin();

            // vérifier si déjà inscrit
            boolean dejaInscrit = inscriptionDAO.findByEtudiant(etudiant).stream()
                .anyMatch(i -> i.getUe().getId().equals(ueId));

            if (dejaInscrit) {
                request.setAttribute("error", "Vous êtes déjà inscrit à cette UE.");
                request.getRequestDispatcher("/vue/inscrireUE.jsp").forward(request, response);

                return;
            }

            InscriptionPedagogique inscription = new InscriptionPedagogique();
            inscription.setEtudiant(etudiant);
            inscription.setUe(ue);
            inscription.setValidee(false);

            inscriptionDAO.create(inscription);

            em.getTransaction().commit();

            response.sendRedirect(request.getContextPath() + "/vue/etudiant/dashboard.jsp");


        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
            request.setAttribute("error", "Erreur lors de l'inscription.");
            request.getRequestDispatcher("/vue/inscrireUE.jsp").forward(request, response);

        } finally {
            em.close();
        }
    }

    @Override
    public void destroy() {
        emf.close();
    }
}
