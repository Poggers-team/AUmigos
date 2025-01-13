<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
<footer>
    <div class="container">
        <div class="footer-columns">
            <!-- Coluna 1 -->
            <div class="footer-column">
                <h4>Sobre Nós</h4>
                <p>
                    A ONG AUmigos resgata, cuida e promove a adoção de cães e gatos abandonados.
                    Além de incentivar a adoção responsável, oferecemos a opção de contribuir com
                    doações para ajudar a transformar vidas. Junte-se a nós nessa causa!
                </p>
            </div>

            <!-- Coluna 2 -->
            <div class="footer-column">
                <h4>Categorias</h4>
                <ul  class="categories">
                    <li><a href="about.jsp">Quem Somos</a></li>
                    <li><a href="FrontController?action=animalList&adopted=false">Adoção</a></li>
                    <li><a href="donate.jsp">Doações</a></li>
                    <li><a href="FrontController?action=home">Histórias de Adoção</a></li>
                    <li><a href="voluntary.jsp">Como Ajudar</a></li>
                    <!--<li><a href="#">Recursos Educativos</a></li>
                    <li><a href="#">Acesso Rápido </a></li>-->
                    <li><a href="FAQ.jsp">Perguntas Frequentes</a></li>
                </ul>
            </div>

            <!-- Coluna 3 -->
            <div class="footer-column">
                <h4>Contato</h4>

                <div class="social-icons">
                    <a href="#"><img src="assets/icons/facebook.svg" alt="Facebook"></a>
                    <a href="#"><img src="assets/icons/instagram.svg" alt="Instagram"></a>
                    <a href="#"><img src="assets/img/whats.png" alt="Whatsapp"></a>
                </div>
                <p>Email: suporte@aumigos.org</p>
            </div>
        </div>

        <!-- Linha Inferior -->
        <div class="footer-bottom">
            <p>© 2024 ONG AUmigos. Todos os direitos reservados. Feito com 💜 </p>
        </div>
    </div>
</footer>
</body>
</html>