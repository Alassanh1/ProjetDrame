<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Confirmation - UASZ</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ffffff;
            font-family: "Segoe UI", sans-serif;
        }
        .container {
            margin-top: 100px;
        }
        .message-box {
            border-left: 5px solid #A0522D;
            padding: 30px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
        }
        .btn-uasz {
            background-color: #007E33;
            color: white;
        }
        .btn-uasz:hover {
            background-color: #005c25;
        }
    </style>
</head>
<body>

<div class="container text-center">
    <div class="message-box">
        <h3 class="text-success">Votre inscription a bien été enregistrée !</h3>
        <p>
            Elle sera examinée par le directeur de l’UFR.
            <br>Un message vous sera envoyé par email dans les plus brefs délais pour vous confirmer sa validation.
        </p>
        <a href="accueil.jsp" class="btn btn-uasz mt-3">Retour à l’accueil</a>
    </div>
</div>

</body>
</html>
