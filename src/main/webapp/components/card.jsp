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

<!-- components/card.jsp -->
<div class="card">
    <img src="${animal.image}" alt="${animal.fileName}">
    <div class="card-info">
        <div class="card-info-left">
            <h3>${animal.name}</h3>
            <p>${animal.city}</p>
        </div>
        <div class="card-icon">
            <img src="assets/icons/star.svg" alt="Ícone de estrela">
            <span>${animal.daysAgo} dias atrás</span>
        </div>
    </div>
</div>

</body>
</html>