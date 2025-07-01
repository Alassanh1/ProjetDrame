<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utilisateur" %>
<%@ page import="model.Role" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // ⚠️ Pour tester sans session active :
    Utilisateur user = new Utilisateur();
    user.setLogin("admin");
    user.setEmail("admin@uasz.edu.sn");
    user.setRole(Role.RESPONSABLE);

    // ✅ Décommente pour la version finale :
    // HttpSession sessionUser = request.getSession(false);
    // Utilisateur user = (Utilisateur) sessionUser != null ? (Utilisateur) sessionUser.getAttribute("utilisateur") : null;
    // if (user == null || user.getRole() != Role.RESPONSABLE) {
    //     response.sendRedirect(request.getContextPath() + "/vue/login.jsp");
    //     return;
    // }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Responsable</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ✅ Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- ✅ Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: "Segoe UI", sans-serif;
        }
        .topbar {
            background-color: #007E33;
            color: white;
            padding: 8px 20px;
            font-weight: bold;
        }
        .navbar-main {
            margin-top: 35px; /* Décalage après topbar */
        }
        .sidebar {
            height: 100vh;
            background-color: #007E33;
            color: white;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
        }
        .sidebar a:hover {
            background-color: #005c25;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        @media (max-width: 768px) {
            .sidebar {
                position: relative;
                height: auto;
                width: 100%;
            }
            .content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>

<jsp:include page="/vue/include/topnavbar.jsp" />

<!-- ✅ Navbar principale -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top navbar-main">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Espace Responsable</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarMain" aria-controls="navbarMain"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarMain">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-person-circle"></i> <%= user.getEmail() %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- ✅ Sidebar + Content -->
<div class="d-flex" style="margin-top: 112px;"> <!-- Décalage de la double navbar -->
    <!-- ✅ Sidebar -->
    <nav class="sidebar flex-column p-3 position-fixed" style="width: 250px;">
        <h4 class="mb-4">Admin Pédagogique</h4>
        <ul class="nav flex-column">
            <li class="nav-item mb-2">
                <a href="#" class="nav-link"><i class="bi bi-speedometer2"></i> Dashboard</a>
            </li>
            <li class="nav-item mb-2">
                <a href="listeEtudiants.jsp" class="nav-link"><i class="bi bi-people"></i> Gérer Étudiants</a>
            </li>
            <li class="nav-item mb-2">
                <a href="gestionFormations.jsp" class="nav-link"><i class="bi bi-journal-text"></i> Gérer Formations</a>
            </li>
            <li class="nav-item mb-2">
                <a href="gestionUE.jsp" class="nav-link"><i class="bi bi-book"></i> Gérer Unités d'Enseignement</a>
            </li>
            <li class="nav-item mb-2">
                <a href="ajoutResponsable.jsp" class="nav-link"><i class="bi bi-person-plus"></i> Ajouter Responsable</a>
            </li>
            <li class="nav-item mb-2">
                <a href="logout.jsp" class="nav-link"><i class="bi bi-box-arrow-right"></i> Déconnexion</a>
            </li>
        </ul>
    </nav>

    <!-- ✅ Content principal -->
    <div class="content">
        <h1 class="mb-4">Bonjour <%= user.getEmail() %> 👋</h1>
        <p>Bienvenue sur votre tableau de bord. Utilisez le menu pour gérer toutes les opérations pédagogiques.</p>

        <div class="row">
            <div class="col-md-4">
                <div class="card p-3 shadow-sm">
                    <h5>Statistiques</h5>
                    <p>Suivi des inscriptions, UEs choisies et validées.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3 shadow-sm">
                    <h5>Alertes</h5>
                    <p>Notifications sur les actions en attente.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
