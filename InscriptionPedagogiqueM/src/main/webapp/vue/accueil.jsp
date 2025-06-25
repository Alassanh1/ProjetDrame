<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Accueil - UASZ Inscription Pédagogique</title>
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
            margin-bottom: 30px;
        }
        nav a {
            color: white;
            margin-right: 20px;
            text-decoration: none;
        }
        nav a:hover {
            text-decoration: underline;
        }
        .section-title {
            color: #007E33;
        }
        .gold-line {
            width: 60px;
            height: 4px;
            background-color: #A0522D;
            margin: 10px auto 30px;
        }
        .formation-card {
            border-left: 5px solid #A0522D;
            background-color: #f9f9f9;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 0 6px rgba(0,0,0,0.05);
        }
        .btn-uasz {
            background-color: #007E33;
            color: white;
            border: none;
        }
        .btn-uasz:hover {
            background-color: #005c25;
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

<!-- HEADER -->
<header class="text-center">
    <h1>Université Assane Seck de Ziguinchor</h1>
    <p class="lead">Plateforme d'inscription pédagogique</p>
    <nav class="mt-3">
        <a href="accueil.jsp">Accueil</a>
        <a href="login.jsp">Connexion</a>
        <a href="inscription.jsp">Inscription</a>
    </nav>
</header>

<!-- CONTENU PRINCIPAL -->
<div class="container">

    <!-- Section Présentation -->
    <section class="text-center mb-5">
        <h2 class="section-title">Qu’est-ce que l’inscription pédagogique ?</h2>
        <div class="gold-line"></div>
        <p class="mb-4">
            L'inscription pédagogique permet aux étudiants de choisir leurs unités d’enseignement (UE),
            notamment les UE optionnelles, en fonction de leur niveau et de leur formation.
            Elle est obligatoire chaque semestre pour valider votre parcours universitaire à l’UASZ.
        </p>
    </section>

    <!-- Formations disponibles -->
    <section>
        <h2 class="section-title text-center">Formations disponibles</h2>
        <div class="gold-line"></div>

        <!-- Licence 1 -->
        <div class="formation-card">
            <h4 class="text-success">Licence 1 - Ingénierie Informatique</h4>
            <ul>
                <li><strong>INF111</strong> – Architecture et Systèmes d’exploitation</li>
                <li><strong>INF112</strong> – Mathématiques pour l'informatique 1</li>
            </ul>
        </div>

        <!-- Licence 2 -->
        <div class="formation-card">
            <h4 class="text-success">Licence 2 - Ingénierie Informatique</h4>
            <ul>
                <li><strong>INF231</strong> – Modélisation aléatoire</li>
                <li><strong>INF232</strong> – Réseaux et systèmes</li>
            </ul>
        </div>

        <!-- Licence 3 -->
        <div class="formation-card">
            <h4 class="text-success">Licence 3 - Ingénierie Informatique</h4>
            <ul>
                <li><strong>INF351</strong> – Réseaux et Télécommunications</li>
                <li><strong>INF352</strong> – Génie Logiciel 1</li>
            </ul>
        </div>
    </section>

    <!-- Boutons -->
    <div class="text-center mt-5">
        <a href="login.jsp" class="btn btn-outline-dark btn-lg mx-2">Se connecter</a>
        <a href="inscription.jsp" class="btn btn-uasz btn-lg mx-2">S'inscrire</a>
    </div>

</div>

<!-- FOOTER -->
<footer>
    <p>&copy; 2025 Université Assane Seck de Ziguinchor – Tous droits réservés.</p>
</footer>

</body>
</html>
