<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    Utilisateur utilisateur = (Utilisateur) session.getAttribute("utilisateur");
    if (utilisateur == null || utilisateur.getRole().toString().equals("ETUDIANT")) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord - Responsable</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
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
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #e0e0e0;
        }
        .action {
            color: white;
            background-color: green;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
        }
        .action:hover {
            background-color: darkgreen;
        }
    </style>
</head>
<body>
<header>
    <h1>Bienvenue <%= utilisateur.getLogin() %> - Responsable Pédagogique</h1>
</header>
<div class="container">
    <h2>Inscriptions à valider</h2>
    <p>Ici s'affichera la liste des inscriptions à valider par UE.</p>

    <table>
        <thead>
            <tr>
                <th>INE Etudiant</th>
                <th>UE</th>
                <th>Statut</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Exemple statique, remplacé ensuite dynamiquement -->
            <tr>
                <td>20250001</td>
                <td>INF204</td>
                <td>Non validée</td>
                <td><a href="#" class="action">Valider</a></td>
            </tr>
        </tbody>
    </table>
</div>
</body>
</html>
