<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doações - ONG AUmigos</title>
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
            text-align: center;
            color: #555;
            line-height: 1.8;
            margin-bottom: 20px;
        }

        .donation-section h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.5rem;
            color: #230735;
            margin-top: 20px;
            text-align: center;
            margin-bottom: 10px;
        }

        .donation-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .donation-section .donation-box {
            width: 48%;
            background: #f9f9f9;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .donation-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .donation-section .donation-box img {
            width: 100%;
            height: auto;
            margin: 0 auto 10px auto;
            display: block;
        }

        .donation-section .donation-box p {
            font-size: 1rem;
            line-height: 1.5;
            color: #333;
        }

        .donation-details strong {
            color: #230735;
        }

        ul {
            list-style-type: disc;
            padding-left: 20px;
            margin-top: 10px;
        }

        ul li {
            margin-bottom: 8px;
        }

        @media (max-width: 800px) {
            .donation-section {
                flex-direction: column;
                align-items: center;
            }

            .donation-section .donation-box {
                width: 100%;
            }
        }

        .donation-box img {
            max-width: 250px;
        }

    </style>
    <link rel="icon" href="assets/img/favicon.png">
</head>
<body>

<header>
    <%@ include file="components/header.jsp" %>
</header>

<main class="main-content">
    <img src="assets/icons/pata.svg" alt="Pata ONG AUmigos">
    <h1>Faça a diferença na vida de um pet!</h1>
    <p>Com a sua ajuda, podemos oferecer cuidado, abrigo e esperança para milhares de cães e gatos abandonados. Cada doação faz a diferença e ajuda a transformar vidas.</p>
<br><br>
    <div class="donation-section">
        <div class="donation-box">
            <h2>Pix</h2>
            <p><strong>Chave Pix:</strong> ong_aumigos@pix.com</p>
            <p>Escaneie o QR Code abaixo ou copie a chave para fazer sua doação:</p>
            <img src="assets/img/pix.png" alt="QR Code para doação">
        </div>

        <div class="donation-box">
            <h2>Depósito/Transferência Bancária</h2><br>
                <p><strong>Banco:</strong> Banco do Brasil</p>
                <p><strong>Agência:</strong> 0000</p>
                <p><strong>Conta Corrente:</strong> 12345-6</p>
                <p><strong>Titular:</strong> ONG AUmigos</p>

        </div>
    </div>
    <br><br>
    <h2>Para onde vai sua doação?</h2>
    <ul>
        <li>Comprar ração e medicamentos;</li>
        <li>Oferecer cuidados veterinários;</li>
        <li>Construir e manter abrigos para os animais;</li>
        <li>Promover campanhas de adoção e conscientização.</li>
    </ul>
    <br>
</main>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>

</body>
</html>
