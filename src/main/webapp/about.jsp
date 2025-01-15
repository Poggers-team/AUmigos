<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quem Somos - ONG AUmigos</title>
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
      padding-top: 160px;
    }

    .main-content {
      max-width: 900px;
      margin: 50px auto;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
      padding: 40px;
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
    }

    .main-content h2 {
      font-family: 'Montserrat', sans-serif;
      font-size: 1.5rem;
      color: #230735;
      margin-top: 20px;
      margin-bottom: 10px;
    }

    .main-content ul {
      text-align: left;
      max-width: 810px;
    }

    .main-content ul li {
      list-style-type: disc;
      color: #343A40;
      font-size: 1rem;
      margin-bottom: 2px;
    }

    .email-section {
      font-size: 1rem;
      color: #555;
      text-align: center;
      margin-top: 20px;
    }

    .email-section a {
      color: #230735;
      font-weight: bold;
      text-decoration: none;
    }

    .email-section a:hover {
      color: #9C0376;
    }

    .values-list,
    .help-list {
      margin: 0;
      padding: 0;
      list-style-position: inside;
    }

    .values-list li,
    .help-list li {
      margin-bottom: 15px;
      font-size: 1rem;
      color: #555;
      line-height: 1.8;
    }

    .values-list li strong,
    .help-list li strong {
      color: #343A40;
      font-weight: bold;
    }

  </style>

  <link rel="icon" href="assets/img/favicon.png">
  
</head>
<body>

<header>
  <%@ include file="components/header.jsp" %>
</header>

<main class="main-content">
  <br>
  <br>
  <img src="assets/icons/pata.svg" alt="Pata ONG AUmigos">
  <h1>Quem Somos</h1> <br><br>
  <p>Bem-vindo à ONG AUmigos!</p>
  <p>Somos a ONG AUmigos, uma organização dedicada ao cuidado e proteção de animais abandonados. Desde a nossa fundação, nossa missão tem sido transformar a vida de cães e gatos, oferecendo-lhes uma segunda chance e conectando-os com famílias amorosas. Mais do que um lugar de acolhimento, somos um ponto de encontro para quem deseja fazer a diferença na vida dos nossos amigos de quatro patas.</p>

  <h2>Nossa História</h2>
  <p>A ONG AUmigos nasceu do desejo de criar um mundo onde nenhum animal fique sem cuidado, amor e segurança. A ideia surgiu ao percebermos a realidade desafiadora enfrentada por milhões de cães e gatos abandonados no Brasil. O que começou como um pequeno grupo de amigos resgatando animais, cresceu para se tornar uma organização comprometida com resgates, cuidados e adoções responsáveis. Hoje, a ONG AUmigos é reconhecida como um espaço de esperança, onde vidas são transformadas diariamente.</p>

  <h2>Nossa Missão</h2>
  <p>Nossa missão é simples: dar uma nova chance para animais abandonados. Queremos garantir que cada pet tenha um lar seguro, amoroso e responsável. Além disso, buscamos conscientizar a sociedade sobre a importância da adoção e da responsabilidade com os animais.</p>

  <h2>Nossos Valores</h2>
  <ul class="values-list">
    <li><strong>Amor pelos Animais:</strong> Cada decisão é guiada pelo cuidado e respeito aos nossos amigos peludos.</li>
    <li><strong>Adoção Responsável:</strong> Acreditamos que a adoção é um compromisso para a vida toda.</li>
    <li><strong>Comunidade Forte:</strong> Conectamos pessoas que compartilham do mesmo amor pelos animais.</li>
    <li><strong>Transparência:</strong> Prezamos por prestar contas de todo o trabalho realizado e do apoio recebido.</li>
  </ul>

  <h2>Como Você Pode Ajudar</h2>
  <ul class="help-list">
    <li><strong>Adote:</strong> Dê a um pet a chance de ser feliz em um lar amoroso.</li>
    <li><strong>Doe:</strong> Sua contribuição ajuda a alimentar, vacinar e cuidar dos nossos animais.</li>
    <li><strong>Seja Voluntário:</strong> Faça parte do time AUmigos e transforme vidas com seu tempo e dedicação.</li>
  </ul><br>
  <p>Queremos convidar você a fazer parte dessa jornada. Seja adotando, doando ou apenas
    compartilhando nossa causa, sua ajuda faz a diferença. Vamos juntos transformar vidas, uma pata de cada vez.</p>

  <h2>Parcerias</h2>
  <p>A ONG AUmigos acredita que juntos podemos ir mais longe. Trabalhamos em parceria com empresas, ONGs e iniciativas que compartilham do nosso propósito. Entre em contato para explorar possibilidades de colaboração.</p>

  <div class="email-section">
    <p>Entre em contato conosco: <a href="mailto:parcerias@aumigos.org">parcerias@aumigos.org</a></p>
  </div>
</main>

<footer>
  <%@ include file="components/footer.jsp" %>
</footer>
</body>
</html>
