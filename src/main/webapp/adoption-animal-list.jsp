<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;

            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            display: flex;
            position: relative;
            flex-direction: row;
            background-color: #fff;
            border-radius: 10px;
            width: 80%;
            max-width: 900px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .close-button {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 24px;
            font-weight: bold;
            color: #000;
            cursor: pointer;
            z-index: 10;
        }

        .close-button:hover {
            color: #9C0376;
        }


        .modal-body {
            display: flex;
            flex-direction: row;
            width: 100%;
        }

        .modal-left {
            flex: 1;
            padding: 20px;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        .modal-left img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }

        .modal-right {
            flex: 1.5;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .modal-right h2 {
            color: #9C0376;
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .modal-right p {
            color: #555;
            line-height: 1.5;
        }

        .modal-right ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .modal-right ul li {
            margin-bottom: 10px;
            font-size: 1rem;
            color: #333;
            font-weight: bold;
        }

        .modal-right ul li span {
            font-weight: normal;
            color: #555;
        }


        #adopt-button {
            background-color: #230735;
            color: #fff;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #adopt-button:hover {
            background-color: #6d014e;
        }


        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            padding-top: 90px;
        }

        .main-content {
            display: flex;
            gap: 30px;
            max-width: 1200px;
            width: 100%;
            margin: 50px auto;
            padding: 20px;
        }

        .filters {
            flex: 1;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .filters h2 {
            margin-bottom: 20px;
            color: #230735;
            font-size: 1.5rem;
            text-align: center;
        }

        .filters label {
            display: block;
            margin-bottom: 10px;
            color: #230735;
            font-size: 1rem;
        }

        .filters input[type="text"],
        .filters select,
        .filters input[type="range"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            font-family: 'Poppins', sans-serif;
            transition: border-color 0.3s;
        }

        .filters input:focus,
        .filters select:focus,
        .filters textarea:focus {
            border-color: #9C0376;
            outline: none;
        }

        .filters button {
            display: block;
            width: 100%;
            padding: 12px;
            background-color: #230735;
            color: white;
            font-weight: 700;
            font-size: 1rem;
            text-align: center;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 20px;
        }

        .filters button:hover {
            background-color: #9C0376;
        }

        .filters .filter-option {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }

        .filters .filter-option span {
            margin-left: 10px;
            color: #230735;
            font-size: 1rem;
        }

        .filters .switch-container {
            display: flex;
            align-items: center;
        }

        .filters .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }

        .filters .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .filters .switch .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            transition: .4s;
            border-radius: 50px;
        }

        .filters .switch input:checked + .slider {
            background-color: #230735;
        }

        .filters .switch .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            border-radius: 50px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
        }

        .filters .switch input:checked + .slider:before {
            transform: translateX(26px);
        }


        .card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            display: flex;
            flex-direction: column;
        }

        .card img {
            width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
        }

        .card-info {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 15px;
            position: relative;
        }

        .card-info h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 1.1rem;
            color: #230735;
            margin-bottom: 10px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .card-info p {
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 10px;
        }

        .card-info span {
            font-size: 0.8rem;
            color: #aaa;
        }

        .card-icon {
            position: absolute;
            top: 15px;
            right: 15px;
        }

        .card-icon img {
            width: 25px;
            height: 25px;
        }

        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
                align-items: center;
            }

            .filters {
                max-width: 100%;
            }

            .cards {
                grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            }

            .filters button {
                width: auto;
                margin-top: 10px;
            }
        }
    </style>
    <link rel="icon" href="assets/img/favicon.png">
</head>
<body>
<header>
    <%@ include file="components/header.jsp" %>
</header>

<c:if test="${empty animals}">
    <h2 class="nothing-animal">Nenhum animal foi cadastrado.</h2>
</c:if>
<div class="main-content">
    <!-- Filtros -->
    <aside class="filters">
        <h2>Filtros</h2>
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade">

        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome">
        <br>
        <label for="cidade">Especie:</label>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="especie" value="cachorro" id="cachorro">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Cachorro</span>
        </div>

        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="especie" value="gato" id="gato">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Gato</span>
        </div>
        <br>
        <label for="cidade">Genero:</label>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="genero" value="macho" id="macho">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Macho</span>
        </div>

        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="radio" name="genero" value="femea" id="femea">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Fêmea</span>
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

    <div class="cards">

        <c:forEach var="animal" items="${animals}">
            <div class="card"
                 data-id="${animal.id}"
                 data-image="data:image/jpeg;base64,${animal.image}"
                 data-name="${animal.name}"
                 data-description="${animal.story}"
                 data-gender="${animal.gender}"
                 data-size="${animal.size}"
                 data-age="${animal.age}">
                <img src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}">
                <div class="card-info">
                    <h3>${animal.name}</h3>
                    <p>${animal.city}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div id="animal-modal" class="modal">
    <div class="modal-content">
        <span class="close-button">&times;</span>
        <div class="modal-body">
            <div class="modal-left">
                <img id="modal-animal-image" src="" alt="Animal">
            </div>
            <div class="modal-right">
                <h2 id="modal-animal-name"></h2>
                <p id="modal-animal-description"></p>
                <ul>
                    <li><strong>Idade:</strong> <span id="modal-animal-age"></span></li>
                    <li><strong>Porte:</strong> <span id="modal-animal-size"></span></li>
                    <li><strong>Gênero:</strong> <span id="modal-animal-gender"></span></li>
                </ul>
                <button id="adopt-button">Adotar</button>

            </div>
        </div>
    </div>
</div>


<footer>
    <%@ include file="components/footer.jsp" %>
</footer>
<script src="assets/js/adoption-animal-list.js"></script>
<script>
    document.querySelectorAll('.card').forEach(card => {
        card.addEventListener('click', () => {
            const animalData = {
                id: card.dataset.id,
                image: card.dataset.image,
                name: card.dataset.name,
                description: card.dataset.description,
                gender: card.dataset.gender,
                size: card.dataset.size,
                age: card.dataset.age
            };

            document.getElementById('modal-animal-image').src = animalData.image;
            document.getElementById('modal-animal-name').innerText = animalData.name;
            document.getElementById('modal-animal-description').innerText = animalData.description;
            document.getElementById('modal-animal-size').innerText = animalData.size.charAt(0).toUpperCase() + animalData.size.slice(1).toLowerCase();
            document.getElementById('modal-animal-age').innerText = animalData.age;
            document.getElementById('modal-animal-gender').innerText = animalData.gender.charAt(0).toUpperCase() + animalData.size.slice(1).toLowerCase();

            document.getElementById('adopt-button').onclick = () => {
                window.location.href = 'FrontController?action=animalAdopt&id=' + animalData.id;
            };

            document.getElementById('animal-modal').style.display = 'flex';
        });

        document.querySelector('.close-button').addEventListener('click', () => {
            document.getElementById('animal-modal').style.display = 'none';
        });

        window.addEventListener('click', (event) => {
            const modal = document.getElementById('animal-modal');
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });
    });
</script>
</body>
</html>
