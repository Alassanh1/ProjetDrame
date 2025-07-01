<%@ page contentType="text/html;charset=UTF-8" %>

<!-- ✅ Import Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600&display=swap" rel="stylesheet">

<style>
    .topbar {
        background-color: #007E33;
        color: white;
        padding: 10px 20px;
        width: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 9999;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        font-family: 'Montserrat', sans-serif;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .topbar .logo-area {
        display: flex;
        align-items: center;
    }

    .topbar img {
        height: 40px;
        margin-right: 10px;
    }

    .topbar .brand {
        flex: 1;
        text-align: center;
        font-size: 1.4rem;
        font-weight: 600;
    }
</style>

<div class="topbar">
    <div class="logo-area">
        <img src="<%= request.getContextPath() %>/assets/img/logo.png" alt="Logo UASZ">
    </div>
    <div class="brand">Université Assane Seck de Ziguinchor</div>
    <div style="width: 40px;"></div> <!-- Espace pour équilibrer le centrage -->
</div>
