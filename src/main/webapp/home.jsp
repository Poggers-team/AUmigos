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

<header>
    <header>
        <%@ include file="components/header.jsp" %>
    </header>
</header>


<section class="hero">
    <div class="container hero-container">
        <div class="content">
            <h1>Ajude um pet a ter uma casa!</h1>
            <p>Ajude a reunir famílias e seus amigos peludos! Encontre ou divulgue um pet agora mesmo.</p>
            <div class="buttons">
                <a href="#" class="btn btn-primary">
                    <img src="assets/icons/search.svg" alt="Ícone de busca">
                    <span>
                        Adotar um Pet
                        <br>
                        <small>Conheça os animais esperando por um lar.</small>
                    </span>
                </a>
                <a href="#" class="btn btn-secondary">
                    <img src="assets/icons/hand.svg" alt="Ícone de ajuda">
                    <span>
                        Cadastrar Pet
                        <br>
                        <small>Ajude seu amigo a encontrar um novo lar.</small>
                    </span>
                </a>
            </div>

        </div>
        <img src="assets/img/pet1.png" alt="Cachorro e dono feliz" class="hero-image">
    </div>
</section>

<section class="find-pet">
    <div class="container">
        <div class="section-header">
            <div class="section-header-left">
                <h2>Encontre seu Novo Amigo!</h2>
                <p>Pets anunciados em <span id="user-location">São Paulo</span>.</p>
            </div>
            <a href="#" class="link-region">Ver na minha região</a>
        </div>
        <div class="cards">
            <!-- Itera sobre a lista de animais -->
            <c:forEach var="animal" items="${animals}">
                <div class="card">
                    <img src="data:image/jpeg;base64,${animal.fotoBase64}" alt="${animal.name}">

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
            </c:forEach>
        </div>
    </div>
</section>


<br> <br>
<section class="mission-section">
    <div class="container">
        <div class="mission-content">
            <h2>Junte-se a nós nessa missão e transforme vidas hoje mesmo.</h2>
            <p>O Brasil enfrenta um grande desafio: mais de <strong>30 milhões de cães e gatos</strong> estão em situação de abandono, aguardando a chance de encontrar um lar amoroso. Cerca de <strong>185 mil desses pets</strong> vivem em abrigos com recursos limitados, esperando por alguém que possa mudar suas vidas.</p>
            <p>Com sua ajuda, podemos transformar essa realidade. Adote um amigo peludo e dê a ele a chance de ter uma família, ou contribua com uma doação para ajudar a cuidar, alimentar e preparar mais animais para a adoção. Juntos, podemos oferecer amor, cuidados e novas oportunidades para milhares de animais.</p>
        </div>
        <div class="donate-call-to-action">
            <h3>Transformando vidas, uma pata de cada vez.</h3>
            <a href="donate.jsp" class="btn-donate">Doe Agora</a>
        </div>
    </div>
</section> <br> <br> <br>


<section class="testimonials">
    <div class="overlay"></div>
    <div class="content">
        <h2>Depoimentos</h2>
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <div class="user-container">
                        <img src="assets/img/testimonial.png" alt="Usuário">
                        <div class="user-info">
                            <h3>Melyna E. Trice</h3>
                            <p>Indaiatuba, SP</p>
                        </div>
                    </div>
                    <blockquote>
                        "Em menos de uma semana de divulgação, o novo tutor do Logan entrou em contato e veio conhecê-lo e buscá-lo. Com tanto amor e mimo, é claro que ele já se adaptou ao novo lar, está super feliz e muito bem cuidado."
                    </blockquote>
                </div>

                <div class="swiper-slide">
                    <div class="user-container">
                        <img src="assets/img/testimonial.png" alt="Usuário">
                        <div class="user-info">
                            <h3>Melyna E. Trice</h3>
                            <p>Indaiatuba, SP</p>
                        </div>
                    </div>
                    <blockquote>
                        "Em menos de uma semana de divulgação, o novo tutor do Logan entrou em contato e veio conhecê-lo e buscá-lo. Com tanto amor e mimo, é claro que ele já se adaptou ao novo lar, está super feliz e muito bem cuidado."
                    </blockquote>
                </div>


            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
</section>

<br> <br><br> <br>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>

<script>
    document.querySelector('.link-region').addEventListener('click', function (event) {
        event.preventDefault();

        const locationElement = document.getElementById('user-location');
        locationElement.textContent = "Obtendo sua localização...";

        if (!navigator.geolocation) {
            locationElement.textContent = "Seu navegador não suporta Geolocalização.";
            console.error("Geolocalização não é suportada pelo navegador.");
            return;
        }

        navigator.geolocation.getCurrentPosition(
            async function (position) {
                const latitude = position.coords.latitude;
                const longitude = position.coords.longitude;

                console.log("Latitude capturada:", latitude);
                console.log("Longitude capturada:", longitude);

                if (!latitude || !longitude) {
                    console.error("Erro: Coordenadas inválidas capturadas.");
                    locationElement.textContent = "Erro ao capturar coordenadas.";
                    return;
                }

                const url = `https://nominatim.openstreetmap.org/reverse?lat=${latitude}&lon=${longitude}&format=json`;

                console.log("URL de requisição montada:", url);

                try {
                    const response = await fetch(url);

                    if (!response.ok) {
                        throw new Error(`Erro na API OpenStreetMap: ${response.statusText}`);
                    }

                    const data = await response.json();
                    console.log("Resposta recebida da API:", data);

                    const address = data.address || {};
                    const city = address.city || address.town || address.village || "Localização não identificada";

                    locationElement.textContent = city;
                } catch (error) {
                    console.error("Erro ao buscar a localização:", error.message);
                    locationElement.textContent = "Erro ao buscar a localização.";
                }
            },
            function (error) {
                console.error("Erro ao acessar geolocalização:", error.message);

                switch (error.code) {
                    case error.PERMISSION_DENIED:
                        locationElement.textContent = "Permissão de localização negada.";
                        break;
                    case error.POSITION_UNAVAILABLE:
                        locationElement.textContent = "Localização indisponível.";
                        break;
                    case error.TIMEOUT:
                        locationElement.textContent = "Tempo de solicitação esgotado.";
                        break;
                    default:
                        locationElement.textContent = "Erro desconhecido ao acessar localização.";
                }
            },
            {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 0
            }
        );
    });




    document.addEventListener("DOMContentLoaded", function () {
        const swiper = new Swiper('.swiper', {
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    });

</script>
</body>
</html>

