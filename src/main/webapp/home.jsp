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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Fredoka+One&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <link rel="icon" href="assets/img/favicon.png">
</head>
<body>

<header>
    <header>
        <%@ include file="components/header.jsp" %>
    </header>
</header>

<c:choose>
    <c:when test="${result == 'registered'}">
        <div class="alert alert-success alert-dismissible fade show"
             role="alert">
            Animal cadastrado com sucesso.
            <button type="button" class="btn-close" data-bs-dismiss="alert"
                    aria-label="Close"></button>
        </div>
    </c:when>
</c:choose>


<section class="hero">
    <div class="container hero-container">
        <div class="content">
            <h1>Ajude um pet a ter uma casa!</h1>
            <p>Ajude a reunir famílias e seus amigos peludos! Encontre ou divulgue um pet agora mesmo.</p>
            <div class="buttons">
                <a href="FrontController?action=animalList&adopted=false" class="btn btn-primary">
                    <img src="assets/icons/search.svg" alt="Ícone de busca">
                    <span>
                        Adotar um Pet
                        <br>
                        <small>Conheça os animais esperando por um lar.</small>
                    </span>
                </a>
                <a href="createPet.jsp" class="btn btn-secondary">
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
            </div>
        </div>
        <div class="cards">
            <c:set var="counter" value="0" />
            <c:forEach var="animal" items="${animals}">
                <c:if test="${counter lt 4}">
                    <a href="FrontController?action=animalList&adopted=false" class="card-link">
                        <div class="card" data-type="${animal.type}">
                            <img class="card-img" src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}">
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
                                    <c:if test="${animal.daysAgo == 0}">
                                        <span>Hoje</span>
                                    </c:if>
                                    <c:if test="${animal.daysAgo != 0}">
                                        <span>${animal.daysAgo} dias atrás</span>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </a>
                    <c:set var="counter" value="${counter + 1}" />
                </c:if>
            </c:forEach>
        </div>
        <br><br>
        <div class="section-footer">
            <a href="FrontController?action=animalList&adopted=false" class="btn-primary">Ver todos os pets</a>
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
                        <img src="assets/img/testimonial2.jpg" alt="Usuário">
                        <div class="user-info">
                            <h3>Wagner Souza</h3>
                            <p>Ibaté, SP</p>
                        </div>
                    </div>
                    <blockquote>
                        "A Mel encontrou um lar cheio de carinho e brincadeiras! Em poucos dias, sua nova família se encantou por ela, e agora vive cercada de amor, com muitos passeios e diversão garantida."
                    </blockquote>
                </div>

                <div class="swiper-slide">
                    <div class="user-container">
                        <img src="assets/img/testimonial3.jpeg" alt="Usuário">
                        <div class="user-info">
                            <h3>Elton S. Zinato</h3>
                            <p>Araraquara, SP</p>
                        </div>
                    </div>
                    <blockquote>
                        "O Max não poderia estar mais feliz! Assim que chegou à sua nova casa, foi recebido com abraços e já se tornou o centro das atenções. Ele agora aproveita cada momento ao lado de sua família."
                    </blockquote>
                </div>

                <div class="swiper-slide">
                    <div class="user-container">
                        <img src="assets/img/testimonial4.jpg" alt="Usuário">
                        <div class="user-info">
                            <h3>Elizabeth Rodrigues</h3>
                            <p>Bauru, SP</p>
                        </div>
                    </div>
                    <blockquote>
                        "A Luna encontrou o lugar perfeito para chamar de lar. Com muito afeto e cuidados, ela se adaptou rapidamente e agora é a companheira inseparável de todos, espalhando alegria e amor pela casa."
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
