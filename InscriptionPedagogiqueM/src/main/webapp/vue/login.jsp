<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion - Responsable Pédagogique</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
            font-family: "Segoe UI", sans-serif;
        }
        header {
            background-color: #007E33;
            color: white;
            padding: 30px 0;
            margin-bottom: 40px;
        }
        nav a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .container {
            max-width: 450px;
        }
        h2 {
            color: #007E33;
        }
        footer {
            background-color: #000000;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }
    </style>
</head>
<body>
<jsp:include page="/vue/include/topnavbar.jsp" />

<!-- ✅ HEADER -->
<header class="text-center">
    <h1>Université Assane Seck de Ziguinchor</h1>
    <p class="lead">Plateforme réservée aux responsables pédagogiques</p>
    <nav class="mt-3">
        <a href="${pageContext.request.contextPath}/vue/accueil.jsp">Accueil</a>
    </nav>
</header>

<!-- ✅ FORMULAIRE -->
<div class="container">
    <h2 class="text-center mb-4">Connexion Responsable</h2>

    <p class="text-center text-muted mb-4">Accès strictement réservé aux responsables pédagogiques de l'UASZ.</p>

    <!-- ✅ Message d'erreur -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/connexion" method="post">
        <div class="mb-3">
            <label for="login" class="form-label">Adresse e-mail</label>
            <input type="text" class="form-control" id="login" name="login" placeholder="ex. admin@uasz.edu.sn" required>
        </div>

        <div class="mb-3">
            <label for="password" class="form-label">Mot de passe</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="••••••••" required>
        </div>

        <button type="submit" class="btn btn-success w-100">Se connecter</button>
    </form>
</div>

<!-- ✅ FOOTER -->
<footer>
    <p>&copy; 2025 Université Assane Seck de Ziguinchor – Tous droits réservés.</p>
</footer>

</body>
</html>
