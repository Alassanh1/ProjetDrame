<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<<<<<<< HEAD
=======
<div class="login-container">
    <h2>Connexion</h2>
    <form action="${pageContext.request.contextPath}/connexion" method="post">

        <label for="login">Nom d'utilisateur :</label>
        <input type="text" id="login" name="login" required>
>>>>>>> 1ffcaa5261b06d0722160e13ad097c444d63b3b1

<div class="container mt-5">
    <h2 class="text-center mb-4">Connexion</h2>

    <form action="ServletConnexion" method="post" class="mx-auto" style="max-width: 400px;">
        <div class="mb-3">
            <label for="email" class="form-label">Adresse email</label>
            <input type="email" name="email" class="form-control" required />
        </div>

        <div class="mb-3">
            <label for="motdepasse" class="form-label">Mot de passe</label>
            <input type="password" name="motdepasse" class="form-control" required />
        </div>

        <div class="d-grid">
            <button type="submit" class="btn btn-primary">Se connecter</button>
        </div>
    </form>
</div>

</body>
</html>
