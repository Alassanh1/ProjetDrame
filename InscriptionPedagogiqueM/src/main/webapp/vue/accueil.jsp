<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - Inscription Pédagogique</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #004080;
            color: white;
            padding: 20px;
            text-align: center;
        }
        nav {
            background-color: #ddd;
            padding: 10px;
            text-align: center;
        }
        nav a {
            margin: 0 15px;
            color: #004080;
            text-decoration: none;
            font-weight: bold;
        }
        .container {
            padding: 30px;
            text-align: center;
        }
        .buttons {
            margin-top: 30px;
        }
        .buttons a {
            display: inline-block;
            padding: 15px 30px;
            margin: 10px;
            font-size: 16px;
            color: white;
            background-color: #004080;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        .buttons a:hover {
            background-color: #003060;
        }
        footer {
            background-color: #004080;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <h1>Bienvenue sur la plateforme d'inscription pédagogique</h1>
</header>
<nav>
    <a href="#">Accueil</a>
    <a href="#">A propos</a>
    <a href="#">Contact</a>
</nav>
<div class="container">
    <h2>Gérez vos inscriptions facilement</h2>
    <p>Connectez-vous ou inscrivez-vous pour accéder aux fonctionnalités d'inscription et de gestion des UE.</p>
    <div class="buttons">
        <a href="${pageContext.request.contextPath}/vue/login.jsp">Se connecter</a>
        <a href="${pageContext.request.contextPath}/vue/inscription.jsp">S'inscrire</a>

    </div>
</div>
<footer>
    &copy; 2025 Université - Tous droits réservés
</footer>
</body>
</html>
