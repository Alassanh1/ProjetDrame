<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion Responsable - UASZ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #ffffff; font-family: "Segoe UI", sans-serif; }
        .title { color: #007E33; }
        .btn-uasz { background-color: #007E33; color: white; }
        .btn-uasz:hover { background-color: #005c25; }
        .info-box { background-color: #f9f9f9; border-left: 5px solid #A0522D; padding: 20px; box-shadow: 0 0 5px rgba(0,0,0,0.05); }
        header { background-color: #007E33; color: white; padding: 30px 0; margin-bottom: 30px; }
        nav a { color: white; margin-right: 20px; text-decoration: none; }
        nav a:hover { text-decoration: underline; }
        footer { background-color: #000000; color: white; text-align: center; padding: 20px; margin-top: 40px; }
    </style>
</head>
<body>

<header class="text-center">
    <h1>Université Assane Seck de Ziguinchor</h1>
    <p class="lead">Espace réservé aux responsables pédagogiques</p>
    <nav class="mt-3">
        <a href="accueil.jsp">Accueil</a>
        <a href="login.jsp">Connexion</a>
        <a href="inscription.jsp">Inscription Étudiant</a>
    </nav>
</header>

<div class="container">
    <div class="row">
        <!-- Infos -->
        <div class="col-md-6">
            <div class="info-box">
                <h5>Accès Responsable</h5>
                <p>
                    Cet espace est strictement réservé aux responsables pédagogiques de l’université.
                    Il permet la gestion des formations, UEs et validations des inscriptions étudiantes.
                </p>
                <p class="text-danger">Toute tentative d'accès non autorisée sera enregistrée.</p>
            </div>
        </div>

        <!-- Formulaire -->
        <div class="col-md-6">
            <h3 class="title mb-4">Connexion Responsable</h3>
            <form action="ServletConnexion" method="post">
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="login" class="form-control" placeholder="ex: responsable@uasz.edu.sn" required />
                </div>
                <div class="mb-3">
                    <label>Mot de passe</label>
                    <input type="password" name="password" class="form-control" required />
                </div>
                <div class="d-grid">
                    <button type="submit" class="btn btn-uasz">Se connecter</button>
                </div>
            </form>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2025 Université Assane Seck de Ziguinchor – Tous droits réservés.</p>
</footer>

</body>
</html>
