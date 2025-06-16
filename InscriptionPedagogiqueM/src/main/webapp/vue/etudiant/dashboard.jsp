<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
    if (utilisateur == null || utilisateur.getRole().toString().equals("RESPONSABLE")) {
        response.sendRedirect("../login.jsp");
        return;
    }
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
    </style>
</head>
<body>
<header>
    <h1>Bienvenue <%= utilisateur.getLogin() %> - Etudiant</h1>
</header>
<div class="container">
    <h2>Mes inscriptions pédagogiques</h2>
    <p>Ici s'affichera la liste de vos UE inscrites.</p>

    <a href="inscrireUE.jsp" class="button">S'inscrire à une UE</a>
</div>
</body>
</html>
