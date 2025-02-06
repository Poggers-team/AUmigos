<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animais para Adoção</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Fredoka+One&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
        }

        .main-content {
            padding: 20px;
            text-align: center;
            margin-top: 150px;
        }

        .section-header {
            margin: 10px auto;
            padding: 20px;
            text-align: center;
        }

        .section-header h2 {
            font-size: 2.5rem;
            color: #230735;
            margin-bottom: 10px;
        }

        .section-header p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 20px;
        }

        .adopted-count {
            font-size: 1.2rem;
            color: #4CAF50;
            background-color: #E8F5E9;
            padding: 10px 20px;
            border-radius: 10px;
            display: inline-block;
        }

        .cards-container {
            max-width: 1200px;
            margin: 0 auto;
            padding-top: 50px;
            padding-bottom: 60px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            justify-items: center;
            margin-top: 30px;
        }

        .card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            width: 100%;
            max-width: 250px;
            position: relative;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-info {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 15px;
            position: relative;
        }

        .card-info-left {
            justify-content: center;
            display: flex;
            flex-direction: column;
        }

        .card-info h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 1rem;
            color: #230735;
            margin-bottom: 5px;
        }

        .card-info p {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 5px;
            display: inline-block;
        }

        .card-info span {
            font-size: 0.8rem;
            color: #aaa;
            display: inline-block;
        }

        .card-info .icon {
            float: right;
            color: #ff5722;
            font-size: 1.2rem;
            margin-top: -20px;
        }

        .card-info .city-time {
            display: flex;
            justify-content: space-between;
            margin-top: 5px;
        }

        .card-badge {
            position: absolute;
            bottom: 80px;
            width: calc(100%);
            background-color: rgba(76, 175, 80, 0.9);
            color: white;
            padding: 1px;
            font-size: 0.9rem;
            font-weight: bold;
            text-align: center;
            z-index: 2;
        }

        .animal-icon {
            width: 28px !important;
            height: 28px !important;
            margin-left: 30px !important;
            display: block;
        }

        .card-icon {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        @media (max-width: 1024px) {
            .cards {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 768px) {
            .cards {
                grid-template-columns: repeat(1, 1fr);
            }
        }
    </style>
</head>
<body>
<header>
    <%@ include file="components/header.jsp" %>
</header>

<div class="main-content">
    <div class="section-header">
        <h2>Animais Adotados</h2>
        <p>Veja as histórias de sucesso de pets que foram adotados e ganharam um novo lar.</p>
        <div class="adopted-count">
            <c:set var="totalAdopted" value="${fn:length(animals)}" />
            <c:out value="${totalAdopted}" /> pets adotados até o momento
        </div>
    </div>
    <div class="cards-container">
        <div class="cards">
            <c:forEach var="animal" items="${animals}">
                <div class="card" data-type="${animal.type}">
                    <img class="card-img" src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}">
                    <div class="card-badge">Adotado ${animal.daysAgo == 0 ? 'Hoje' : animal.daysAgo + ' dias atrás'}</div>
                    <div class="card-info">
                        <div class="card-info-left">
                            <h3>${animal.name}</h3>
                            <p>${animal.city}</p>
                        </div>
                        <div class="card-icon">
                            <c:choose>
                                <c:when test="${animal.type == 'CACHORRO'}">
                                    <img class="animal-icon" src="assets/icons/dog.svg" alt="Ícone de cachorro">
                                </c:when>
                                <c:when test="${animal.type == 'GATO'}">
                                    <img class="animal-icon" src="assets/icons/cat.svg" alt="Ícone de gato">
                                </c:when>
                                <c:otherwise>
                                    <img class="animal-icon" src="assets/icons/star.svg" alt="Ícone estrelaa">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>
</body>
</html>
