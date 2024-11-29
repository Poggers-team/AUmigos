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
    <link rel="stylesheet" href="assets/css/adoption-animal-list.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Fredoka+One&family=Montserrat:wght@700&display=swap" rel="stylesheet">
</head>
<body>

<header>
    <header>
        <%@ include file="components/header.jsp" %>
    </header>
</header>
<br><br><br><br>

<section class="find-pet">

    <div class="container">
        <div class="section-header">
            <div class="section-header-left">
                <h2>Ultimas Adocoes</h2>
                <p>Veja as histórias de sucesso de pets que foram adotados e ganharam um novo lar</span>.</p>
            </div>
        </div>
        <div class="cards">
            <c:forEach var="animal" items="${animals}">
                <div class="card">
                    <img src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}">

                    <div class="card-info">
                        <div class="card-info-left">
                            <h3>${animal.name}</h3>
                            <p>${animal.city}</p>
                        </div>
                        <div class="card-icon">
                            <img src="assets/icons/star.svg" alt="Ícone de estrela">
                            <c:if test="${animal.daysAgo == 0}">
                                <span>Hoje</span>
                            </c:if>
                            <c:if test="${animal.daysAgo != 0}">
                                <span>${animal.daysAgo} dias atrás</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <br><br>
    </div>
</section>


<br> <br><br> <br>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>

