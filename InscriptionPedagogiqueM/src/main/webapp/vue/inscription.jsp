<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Inscription - UASZ</title>
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

<!-- HEADER -->
<header class="text-center">
    <h1>Université Assane Seck de Ziguinchor</h1>
    <p class="lead">Inscription pédagogique</p>
    <nav class="mt-3">
        <a href="accueil.jsp">Accueil</a>
        <a href="login.jsp">Connexion</a>
        <a href="inscription.jsp">Inscription</a>
    </nav>
</header>

<!-- CONTENU -->
<div class="container">
    <div class="row">

        <!-- Infos -->
        <div class="col-md-6">
            <div class="info-box">
                <h5>Bienvenue à l’UASZ</h5>
                <p>Veuillez remplir ce formulaire pour effectuer votre inscription pédagogique.</p>
                <p>Choisissez votre filière, votre niveau et vos UEs optionnelles.</p>
            </div>
        </div>

        <!-- Formulaire -->
        <div class="col-md-6">
            <h3 class="title mb-4">Formulaire d'inscription</h3>
            <form action="InscriptionServlet" method="post">

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label>Nom</label>
                        <input type="text" name="nom" class="form-control" required />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label>Prénom</label>
                        <input type="text" name="prenom" class="form-control" required />
                    </div>
                </div>

                <div class="mb-3">
                    <label>Date de naissance</label>
                    <input type="date" name="naissance" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label>Sexe</label>
                    <select name="sexe" class="form-select" required>
                        <option value="">-- Choisir --</option>
                        <option value="H">Homme</option>
                        <option value="F">Femme</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label>Adresse</label>
                    <input type="text" name="adresse" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label>Filière</label>
                    <select name="filiere" class="form-select" required>
                        <option value="">-- Choisir votre filière --</option>
                        <option value="L2i">L2i - Ingénierie Informatique</option>
                        <option value="GL">Génie Logiciel</option>
                        <option value="R&T">Réseaux & Télécoms</option>
                        <!-- Tu peux ajouter d'autres ici -->
                    </select>
                </div>

                <div class="mb-3">
                    <label>Niveau</label>
                    <select name="niveau" class="form-select" required>
                        <option value="">-- Choisir votre niveau --</option>
                        <option value="L1">Licence 1</option>
                        <option value="L2">Licence 2</option>
                        <option value="L3">Licence 3</option>
                    </select>
                </div>

                <!-- UEs optionnelles (extraites du backend ou statiques ici) -->
                <div class="mb-3">
                    <label>Choisissez vos UEs optionnelles :</label>
                    <c:forEach var="ue" items="${uesOptionnelles}">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" name="ues" value="${ue.code}" id="ue${ue.code}">
                            <label class="form-check-label" for="ue${ue.code}">
                                ${ue.nom} (${ue.code}) - ${ue.enseignantResponsable}
                            </label>
                        </div>
                    </c:forEach>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn btn-uasz">Valider l'inscription</button>
                </div>
            </form>
        </div>

    </div>
</div>

<!-- FOOTER -->
<footer>
    <p>&copy; 2025 Université Assane Seck de Ziguinchor – Tous droits réservés.</p>
</footer>

</body>
</html>
