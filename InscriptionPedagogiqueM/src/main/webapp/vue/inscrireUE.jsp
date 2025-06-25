<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.persistence.*, java.util.List" %>
<%@ page import="model.UE" %>
<%@ page import="model.Utilisateur" %>
<%
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
    if (utilisateur == null || utilisateur.getRole().toString().equals("RESPONSABLE")) {
        response.sendRedirect("login.jsp");
        return;
    }

    EntityManagerFactory emf = (EntityManagerFactory) application.getAttribute("emf");
    if (emf == null) {
        emf = Persistence.createEntityManagerFactory("InscriptionPU");
        application.setAttribute("emf", emf);
    }
    EntityManager em = emf.createEntityManager();
    List<UE> listeUe = em.createQuery("SELECT u FROM UE u", UE.class).getResultList();
    em.close();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription à une UE</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        .form-container {
            width: 500px;
            margin: 80px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #004080;
        }
        label, select, input[type="submit"] {
            display: block;
            width: 100%;
            margin-top: 15px;
        }
        select, input[type="submit"] {
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background-color: #004080;
            color: white;
            border: none;
        }
        input[type="submit"]:hover {
            background-color: #003060;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>S'inscrire à une UE</h2>
    <form action="${pageContext.request.contextPath}/inscription-ue" method="post">

        <label for="ue">Choisissez une UE :</label>
        <select name="ueId" id="ue" required>
            <% for (UE ue : listeUe) { %>
                <option value="<%= ue.getId() %>"><%= ue.getNom() %> - <%= ue.getCode() %></option>
            <% } %>
        </select>

        <input type="submit" value="M'inscrire">
    </form>
</div>
</body>
</html>
