<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
         
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animais para Adoção</title>
    <link rel="stylesheet" href="assets/css/adoption-animal-list.css">
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
            padding-top: 90px;
        }

        .main-content {
            max-width: 900px;
            margin: 50px auto;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            padding: 40px;
            padding-left: 100px;
            padding-right: 100px;
            text-align: left;
        }


        .main-content img {
            display: block;
            margin: 0 auto;
            width: 164px;
            height: 183px;
            margin-bottom: 20px;
        }

        .main-content h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.2rem;
            color: #230735;
            text-align: center;
            margin-bottom: 20px;
        }

        .main-content p {
            font-size: 1rem;
            color: #555;
            line-height: 1.8;
            margin-bottom: 30px;
            text-align: center;
        }

        .main-content h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.5rem;
            color: #230735;
            margin-top: 20px;
            margin-left: 40px;
            margin-bottom: 10px;
        }

        .form-container {
            margin-top: 20px;
            text-align: left;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
        }

        label {
            display: block;
            font-weight: 600;
            color: #230735;
            margin-bottom: 10px;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            transition: border-color 0.3s;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #9C0376;
            outline: none;
        }

        textarea {
            resize: none;
            height: 120px;
        }

        #submit-btn {
            display: block;
            margin: 0 auto;
            background-color: #230735;
            color: #fff;
            font-weight: 700;
            font-size: 1rem;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }

        #submit-btn:hover {
            background-color: #9C0376;
        }

        ul {
            list-style-type: disc;
            padding-left: 20px;
            margin-top: 10px;
        }

        ul li {
            margin-bottom: 8px;
        }

    </style>
</head>
<body>
    <header>
        <%@ include file="components/header.jsp" %>
    </header>
<div class="container">
    <aside class="filters">
        <h2>Filtros</h2>
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade">
    
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome">
        
        <div>
            <span>Espécie:</span>
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="especie" value="cachorro" id="cachorro">
                    <span class="slider"></span>
                </label>
                <span>Cachorro</span>
            </div>
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="especie" value="gato" id="gato">
                    <span class="slider"></span>
                </label>
                <span>Gato</span>
            </div>
        </div>
    
        <div>
            <span>Gênero:</span>
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="genero" value="macho" id="macho">
                    <span class="slider"></span>
                </label>
                <span>Macho</span>
            </div>
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="genero" value="femea" id="femea">
                    <span class="slider"></span>
                </label>
                <span>Fêmea</span>
            </div>
        </div>
    
        <label for="porte">Porte:</label>
        <select id="porte" name="porte">
            <option value="pequeno">Pequeno</option>
            <option value="medio">Médio</option>
            <option value="grande">Grande</option>
        </select>
    
        <label for="pelagem">Pelagem:</label>
        <select id="pelagem" name="pelagem">
            <option value="branco">Branco</option>
            <option value="loiro">Loiro</option>
            <option value="preto">Preto</option>
        </select>
    
        <label for="idade">Idade Máxima: <span id="idade-valor">8</span> anos</label>
        <input type="range" id="idade" name="idade" min="1" max="15" value="8" class="custom-slider">           
        <br><br>
        <label for="distancia">Distância: <span id="distancia-valor">50</span> Km</label>
        <input type="range" id="distancia" name="distancia" min="1" max="100" value="50" class="custom-slider"> 

        <button class="apply-button">Aplicar Filtros</button>
        <button class="clean-button">Limpar Filtros</button>
    </aside>
    
    <main class="ads">
<c:if test="${empty animals || animals == null}">
    <h2 class="nothing-animal">Nenhum animal foi cadastrado.</h2>
</c:if>

        
        <c:if test="${not empty animals}">
            <c:forEach var="animal" items="${animals}">
                <div class="ad">
                    <img src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}">
                    <h3>${animal.name}</h3>
                    <p>Raça: ${animal.breed}</p>
                    <p>Espécie: 
                        <c:choose>
                            <c:when test="${animal.type == 'CACHORRO'}">Cachorro</c:when>
                            <c:otherwise>Gato</c:otherwise>
                        </c:choose>
                    </p>
                    <p>Gênero: 
                        <c:choose>
                            <c:when test="${animal.gender == 'MASCULINO'}">Masculino</c:when>
                            <c:otherwise>Feminino</c:otherwise>
                        </c:choose>
                    </p>
                    <p>Cidade: ${animal.city}</p>
                </div>
            </c:forEach>
        </c:if>
    </main>
</div>
<footer>
    <%@ include file="components/footer.jsp" %>
</footer>
<script src="assets/js/adoption-animal-list.js"></script>
</body>

</html>
