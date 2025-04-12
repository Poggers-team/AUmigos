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

        #modal-animal-image {

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
            width: 100%;  !important;
            height: 250px !important;
            object-fit: cover;
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
            margin: auto;
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
            width: 600px;
            max-width: 300px;
            padding: 20px;
            box-sizing: border-box;
            background-color: #f4f4f4;
            height: 100%;
            position: sticky;
            top: 0;
            border-radius: 4px;
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
        .filters select {
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
            width: 60px;
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

        .card.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .card {
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            width: 100%;
            max-width: 250px;
            position: relative;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }


        .card-img {
            width: 100%;  !important;
            height: 200px !important;
            border-bottom: 4px solid #230735 !important;
            object-fit: cover;
            margin-bottom: -10px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            width: 100%;
            justify-content: center;
        }

        .card-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .card-info h3 {
            font-family: 'Montserrat', sans-serif;
            font-weight: bold;
            font-size: 1.2rem;
            color: #230735;
            margin: 0;
        }

        .card-info p {
            font-size: 1rem;
            color: #555;
            margin: 0;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .card-icon {
            position: absolute;
            top: 15px;
            right: 15px;
        }

        .card-icon img {
            width: 30px !important;
            height: 30px !important;
        }

        .range-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }

        .range-min, .range-max {
            font-size: 14px;
            color: #333;
            padding-top: 3px;
        }

        .range-min {
            padding-right: 7px;
        }

        .range-max {
            padding-left: 7px;
        }

        .cleanbutton:hover {
            transform: scale(1.015);
            transition: 0.2s;
        }

        input[type="range"] {
            -webkit-appearance: none;
            appearance: none;
            background: transparent;
            cursor: pointer;
            width: 25rem;
        }

        input[type="range"]:focus {
            outline: none;
        }

        input[type="range"]::-webkit-slider-runnable-track {
            background-color: #cacaca99;
            border-radius: 0.5rem;
            height: 0.5rem;
        }

        input[type="range"]::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            margin-top: -5px;
            background-color: #362b3d;
            border-radius: 2rem;
            height: 1.2rem;
            width: 1.2rem;
        }

        input[type="range"]::-moz-range-track {
            background-color: #362b3d;
            border-radius: 0.5rem;
            height: 0.5rem;
        }

        input[type="range"]::-moz-range-thumb {
            background-color: #cacaca99;
            border: none;
            border-radius: 2rem;
            height: 1.2rem;
            width: 1.2rem;
        }

        .card-info {
            text-align: left;
        }

        .animal-icon {
            width: 28px !important;
            height: 28px !important;
            margin-left: 30px !important;
            display: block;
        }
        .cards-container {
            width: 100%;
        }

        .section-title {
            width: 100%;
            padding: 10px;
            font-size: 2rem;
            font-family: 'Poppins', sans-serif;
            color: #230735;
        }

        .card-icon {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        @media (max-width: 1200px) {
            .cards {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .main-content {
                flex-direction: column;
                padding: 10px;
                gap: 15px;
            }

            .filters {
                width: 100%;
                max-width: none;
                position: relative;
                top: auto;
                border-radius: 8px;
                padding: 15px;
                margin-bottom: 20px;
            }

            .cards {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
                gap: 15px;
            }

            .card {
                max-width: 100%;
            }

            .card-img {
                height: 150px;
            }

            .section-title {
                width: 100%;
                padding: 10px;
                font-size: 2rem;
                font-family: 'Poppins', sans-serif;
                align-items: center;
                text-align: center;
                color: #230735;
            }
        }

        @media (max-width: 480px) {
            .filters {
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .filters h2 {
                font-size: 1.2rem;
                margin-bottom: 15px;
                text-align: center;
            }

            .filters label {
                font-size: 0.9rem;
                margin-bottom: 5px;
            }

            .filters input[type="text"],
            .filters select {
                font-size: 0.9rem;
                padding: 8px;
                border-radius: 6px;
            }

            .filters .filter-option {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 10px;
            }

            .filters .switch-container {
                flex-shrink: 0;
            }

            .filters button {
                font-size: 1rem;
                padding: 10px;
                background-color: #6d014e;
                border-radius: 8px;
            }

            .section-title {
                width: 100%;
                padding: 10px;
                font-size: 2rem;
                font-family: 'Poppins', sans-serif;
                align-items: center;
                text-align: center;
                color: #230735;
            }

            .range-container {
                flex-direction: column;
                align-items: stretch;
                gap: 5px;
            }

            .range-container span {
                font-size: 0.8rem;
                margin: 0;
                text-align: center;
            }

            #idade {
                width: 100%;
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
    <aside class="filters">
        <h2>Filtros</h2>
        <label for="cidade">Cidade:</label>
        <input type="text" id="cidade" name="cidade" placeholder="Digite a cidade">

        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" placeholder="Digite o nome">
        <label>Espécie:</label>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="checkbox" name="especie" value="cachorro" id="cachorro">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Cachorro</span>
        </div>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="checkbox" name="especie" value="gato" id="gato">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Gato</span>
        </div>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="checkbox" name="especie" value="outro" id="outro">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Outro</span>
        </div>

        <label>Gênero:</label>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="checkbox" name="genero" value="macho" id="macho">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Macho</span>
        </div>
        <div class="filter-option">
            <div class="switch-container">
                <label class="switch">
                    <input type="checkbox" name="genero" value="femea" id="femea">
                    <span class="slider"></span>
                </label>
            </div>
            <span>Fêmea</span>
        </div>

        <label for="porte">Porte:</label>
        <select id="porte" name="porte" class="porte">
            <option value="">Todos</option>
            <option value="pequeno">Pequeno</option>
            <option value="medio">Médio</option>
            <option value="grande">Grande</option>
        </select>

        <label for="idade">Idade Máxima: <span id="idade-valor">20</span> anos</label>
        <div class="range-container">
            <span class="range-min">1</span>
            <input type="range" id="idade" name="idade" min="1" max="20" value="20" class="custom-slider">
            <span class="range-max">20</span>
        </div>
        <br>
        <button type="button" id="limpar-filtros" class="cleanbutton">Limpar Filtros</button>
    </aside>

    <div class="cards-container">
        <h2 class="section-title">Animais para Adoção</h2>
        <div class="cards">
            <c:forEach var="animal" items="${animals}">
                <div class="card"
                     data-image="data:image/jpeg;base64,${animal.image}"
                     data-id="${animal.id}"
                     data-name="${animal.name}"
                     data-description="${animal.story}"
                     data-gender="${animal.gender}"
                     data-size="${animal.size}"
                     data-type="${animal.type}"
                     data-age="${animal.age}"
                     data-city="${animal.city}">
                    <img class="card-img" src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}">
                    <div class="card-info">
                        <h3>${animal.name}<p>${animal.city}</p></h3>
                        <div class="card-icon">
                            <c:choose>
                                <c:when test="${animal.type == 'CACHORRO'}">
                                    <img class="animal-icon" src="assets/icons/dog.svg" alt="Ícone de cachorro">
                                </c:when>
                                <c:when test="${animal.type == 'GATO'}">
                                    <img class="animal-icon" src="assets/icons/cat.svg" alt="Ícone de gato">
                                </c:when>
                                <c:otherwise>
                                    <img class="animal-icon" src="assets/icons/star.svg" alt="Ícone estrela">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
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
               <!-- <button id="delete-button">Deletar</button> -->
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
        const observerOptions = {
            root: null,
            threshold: 0.5,
        };

        const observer = new IntersectionObserver((entries, observer) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add("visible");
                    observer.unobserve(entry.target);
                }
            });
        }, observerOptions);

        const cards = document.querySelectorAll(".card");
        cards.forEach(card => observer.observe(card));

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
            document.getElementById('modal-animal-gender').innerText = animalData.gender.charAt(0).toUpperCase() + animalData.gender.slice(1).toLowerCase();

            document.getElementById('adopt-button').onclick = () => {
                window.location.href = 'FrontController?action=animalAdopt&id=' + animalData.id;
            };

//            document.getElementById('delete-button').onclick = () => {
//                window.location.href = 'FrontController?action=deleteAnimal&id=' + animalData.id;
//           };

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

    document.addEventListener('DOMContentLoaded', () => {
        const animals = document.querySelectorAll('.card');

        const filters = {
            cidade: document.getElementById('cidade'),
            nome: document.getElementById('nome'),
            genero: document.getElementsByName('genero'),
            especie: document.getElementsByName('especie'),
            porte: document.getElementById('porte'),
            idade: document.getElementById('idade'),
        };

        const filterAnimals = () => {
            animals.forEach(card => {
                const city = card.dataset.city.toLowerCase();
                const name = card.dataset.name.toLowerCase();
                const gender = card.dataset.gender.toLowerCase();
                const type = card.dataset.type.toLowerCase();
                const size = card.dataset.size.toLowerCase();
                const age = parseInt(card.dataset.age, 10);

                const cidadeFilter = filters.cidade?.value.toLowerCase() || '';
                const nomeFilter = filters.nome?.value.toLowerCase() || '';
                const generoFilter = Array.from(filters.genero).find(r => r.checked)?.value.toLowerCase() || '';
                const especieFilter = Array.from(filters.especie).find(r => r.checked)?.value.toLowerCase() || '';
                const porteFilter = filters.porte?.value.toLowerCase() || '';
                const idadeFilter = parseInt(filters.idade?.value || 0, 10);

                let isVisible = true;

                if (cidadeFilter && !city.includes(cidadeFilter)) isVisible = false;
                if (nomeFilter && !name.includes(nomeFilter)) isVisible = false;
                if (generoFilter && gender !== generoFilter) isVisible = false;
                if (especieFilter && type !== especieFilter) isVisible = false;
                if (porteFilter && size !== porteFilter) isVisible = false;
                if (idadeFilter && age > idadeFilter) isVisible = false;

                card.style.display = isVisible ? 'block' : 'none';
            });
        };


        filters.cidade?.addEventListener('input', filterAnimals);
        filters.nome?.addEventListener('input', filterAnimals);
        filters.genero?.forEach(r => r.addEventListener('change', filterAnimals));
        filters.especie?.forEach(r => r.addEventListener('change', filterAnimals));
        filters.porte?.addEventListener('change', filterAnimals);
        filters.idade?.addEventListener('input', () => {
            document.getElementById('idade-valor').textContent = filters.idade.value;
            filterAnimals();
        });

        filterAnimals();

        document.getElementById('limpar-filtros').addEventListener('click', function() {

            document.getElementById('cidade').value = '';
            document.getElementById('nome').value = '';

            document.querySelectorAll('input[name="especie"]').forEach(radio => {
                radio.checked = false;
            });

            document.querySelectorAll('input[name="genero"]').forEach(radio => {
                radio.checked = false;
            });

            document.getElementById('porte').value = '';

            document.getElementById('idade').value = 20;
            document.getElementById('idade-valor').textContent = 20;
            filterAnimals();
        });

    });

    function toggleSpeciesSelection(selectedSpecies) {
        const speciesOptions = document.querySelectorAll('input[name="especie"]');
        speciesOptions.forEach(species => {
            if (species !== selectedSpecies) {
                species.checked = false;
            }
        });
    }

    function toggleGenderSelection(selectedGender) {
        const genderOptions = document.querySelectorAll('input[name="genero"]');
        genderOptions.forEach(gender => {
            if (gender !== selectedGender) {
                gender.checked = false;
            }
        });
    }

    const cachorro = document.getElementById('cachorro');
    const gato = document.getElementById('gato');
    const outro = document.getElementById('outro');
    const macho = document.getElementById('macho');
    const femea = document.getElementById('femea');

    if (cachorro) {
        cachorro.addEventListener('change', function () {
            if (this.checked) {
                toggleSpeciesSelection(this);
            }
        });
    }

    if (gato) {
        gato.addEventListener('change', function () {
            if (this.checked) {
                toggleSpeciesSelection(this);
            }
        });
    }

    if (outro) {
        outro.addEventListener('change', function () {
            if (this.checked) {
                toggleSpeciesSelection(this)
            }
        })
    }

    if (macho) {
        macho.addEventListener('change', function () {
            if (this.checked) {
                toggleGenderSelection(this);
            }
        });
    }

    if (femea) {
        femea.addEventListener('change', function () {
            if (this.checked) {
                toggleGenderSelection(this);
            }
        });
    }


</script>
</body>
</html>
