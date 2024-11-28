<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONG AUmigos</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="assets/css/home.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Fredoka+One&family=Montserrat:wght@700&display=swap" rel="stylesheet">
</head>

<body>
<nav class="container">
    <div class="logo">
        <a href="home.jsp"><img src="assets/img/logopata.png" alt="Logo ONG AUmigos"></a>
        <span href="home.jsp">ONG AUmigos</span>
    </div>
    <div class="menu-container">
        <ul class="menu">
            <li><a href="home.jsp">Home</a></li>
            <li>
                <a href="#">Adoção</a>
                <ul>
                    <li><a href="#">Pets para Adoção</a></li>
                    <li><a href="#">Pets Adotados</a></li>
                    <li><a href="createPet.jsp">Cadastrar Pets</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Conheça</a>
                <ul>
                    <li><a href="about.jsp">Nossa História</a></li>
                    <li><a href="contact.jsp">Contato</a></li>
                    <li><a href="FAQ.jsp">Perguntas Frequentes</a></li>
                </ul>
            </li>
            <li>
                <a href="#">Ajude</a>
                <ul>
                    <li><a href="donate.jsp">Doar para ONG</a></li>
                    <li><a href="voluntary.jsp">Voluntário</a></li>
                </ul>
            </li>
        </ul>


<c:choose>
    <c:when test="${empty sessionScope.user}">
        <a href="login.jsp">
            <button id="loginButton" class="btn-login" style="border: none; cursor: pointer;">Entrar</button>
        </a>
    </c:when>
    <c:otherwise>
        <a href="logout">
            <button id="logoutButton" class="btn-login" style="border: none; cursor: pointer;">Sair</button>
        </a>
    </c:otherwise>
</c:choose>


    </div>
</nav>
</body>
</html>
