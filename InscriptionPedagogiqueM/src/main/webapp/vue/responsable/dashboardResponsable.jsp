<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionUser = request.getSession(false);
    Utilisateur user = (Utilisateur) sessionUser.getAttribute("user");
    if (user == null || !"responsable".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord - Responsable</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #ffffff; font-family: "Segoe UI", sans-serif; }
        header { background-color: #007E33; color: white; padding: 30px 0; margin-bottom: 30px; }
        nav a { color: white; margin-right: 20px; text-decoration: none; }
        nav a:hover { text-decoration: underline; }
        footer { background-color: #000000; color: white; text-align: center; padding: 20px; margin-top: 40px; }
        .section-title { color: #007E33; }
        .card-option {
            border-left: 5px solid #A0522D;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
            background-color: #f9f9f9;
            padding: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<!-- HEADER -->
<header class="text-center">
    <h1>Université Assane Seck de Ziguinchor</h1>
    <p class="lead">Espace Responsable Pédagogique</p>
    <nav class="mt-3">
        <a href="dashboardResponsable.jsp">Dashboard</a>
        <a href="logout.jsp">Déconnexion</a>
    </nav>
</header>

<div class="container">
    <h3 class="section-title">Bonjour <%= user.getEmail() %> 👋</h3>

    <div class="row mt-4">
        <!-- Gérer étudiants -->
        <div class="col-md-4">
            <div class="card-option">
                <h5>Liste des étudiants</h5>
                <p>Voir tous les étudiants inscrits avec leurs informations et UEs choisies.</p>
                <a href="listeEtudiants.jsp" class="btn btn-sm btn-outline-success">Voir</a>
            </div>
        </div>

        <!-- Gérer formations -->
        <div class="col-md-4">
            <div class="card-option">
                <h5>Formations & Filières</h5>
                <p>Ajouter, modifier ou supprimer les formations proposées à l’université.</p>
                <a href="gestionFormations.jsp" class="btn btn-sm btn-outline-success">Gérer</a>
            </div>
        </div>

        <!-- Gérer UEs -->
        <div class="col-md-4">
            <div class="card-option">
                <h5>Unités d’Enseignement</h5>
                <p>Gérer les UEs disponibles selon les filières et niveaux (obligatoires / optionnelles).</p>
                <a href="gestionUE.jsp" class="btn btn-sm btn-outline-success">Gérer</a>
            </div>
        </div>
    </div>
</div>

<!-- FOOTER -->
<footer>
    <p>&copy; 2025 Université Assane Seck de Ziguinchor – Tous droits réservés.</p>
</footer>

</body>
</html>
