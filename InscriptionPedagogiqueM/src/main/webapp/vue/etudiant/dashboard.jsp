<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="jakarta.persistence.*, java.util.List" %>
<%@ page import="model.Etudiant, model.InscriptionPedagogique" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
    if (utilisateur == null || utilisateur.getRole().toString().equals("RESPONSABLE")) {
        response.sendRedirect(request.getContextPath() + "/vue/login.jsp");
        return;
    }

    EntityManagerFactory emf = (EntityManagerFactory) application.getAttribute("emf");
    if (emf == null) {
        emf = Persistence.createEntityManagerFactory("InscriptionPU");
        application.setAttribute("emf", emf);
    }
    EntityManager em = emf.createEntityManager();
    Etudiant etudiant = em.find(Etudiant.class, utilisateur.getLogin());
    List<InscriptionPedagogique> inscriptions = em.createQuery("SELECT i FROM InscriptionPedagogique i WHERE i.etudiant = :etudiant", InscriptionPedagogique.class)
        .setParameter("etudiant", etudiant)
        .getResultList();
    em.close();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord - Etudiant</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef2f3;
            margin: 0;
        }
        header {
            background-color: #004080;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .container {
            padding: 20px;
        }
        h2 {
            color: #004080;
        }
        a.button {
            display: inline-block;
            margin: 10px 0;
            padding: 10px 20px;
            background-color: #004080;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        a.button:hover {
            background-color: #003060;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ccc;
        }
        th {
            background-color: #d0e0f0;
        }
    </style>
</head>
<body>
<header>
    <h1>Bienvenue <%= utilisateur.getLogin() %> - Etudiant</h1>
</header>
<div class="container">
    <h2>Mes inscriptions pédagogiques</h2>
    <table>
        <thead>
        <tr>
            <th>Nom UE</th>
            <th>Code</th>
            <th>Crédits</th>
            <th>Validée</th>
        </tr>
        </thead>
        <tbody>
        <% for (InscriptionPedagogique ip : inscriptions) { %>
            <tr>
                <td><%= ip.getUe().getNom() %></td>
                <td><%= ip.getUe().getCode() %></td>
                <td><%= ip.getUe().getCredits() %></td>
                <td><%= ip.isValidee() ? "Oui" : "Non" %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/vue/inscrireUE.jsp" class="button">S'inscrire à une UE</a>
</div>
</body>
</html>
