<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perguntas Frequentes - ONG AUmigos</title>
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


        .faq-answer {
            font-size: 1rem;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.8;
        }

        .faq-toggle {
            background: none;
            border: none;
            color: #230735;
            font-size: 1.1rem;
            text-align: left;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .faq-toggle span {
            font-weight: bold;
        }

        .faq-toggle:hover {
            color: #9C0376;
        }

        .faq-answer {
            display: none;
            padding-top: 10px;
        }

        .faq-toggle svg {
            transition: transform 0.3s ease;
        }

        .faq-toggle.open svg {
            transform: rotate(180deg);
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
    <h1>Perguntas Frequentes</h1> <br><br>

    <button class="faq-toggle">
        <span>Como adotar um pet?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Para adotar um pet, você pode visitar a página de adoção, escolher o animal e preencher o formulário de adoção.
    </div>

    <button class="faq-toggle">
        <span>Quais documentos são necessários para adotar?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        RG, CPF, comprovante de residência e assinatura de um termo de responsabilidade.
    </div>

    <button class="faq-toggle">
        <span>Há algum custo para adoção?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Não cobramos pela adoção, mas pedimos uma ajuda para cobrir despesas com vacinação e castração, quando aplicável.
    </div>

    <button class="faq-toggle">
        <span>Como posso doar para a ONG?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Você pode doar através do botão "Doe Agora" em nosso site ou via Pix.
    </div>

    <button class="faq-toggle">
        <span>Para onde vai o dinheiro das doações?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        As doações são utilizadas para alimentação, vacinas, cuidados médicos e melhorias no abrigo.
    </div>

    <button class="faq-toggle">
        <span>Posso doar itens físicos?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Sim! Aceitamos ração, medicamentos, produtos de limpeza e brinquedos. Entre em contato para combinar a entrega.
    </div>

    <button class="faq-toggle">
        <span>Como me inscrevo para ser voluntário?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Basta preencher o formulário na página de voluntariado. Nossa equipe entrará em contato.
    </div>

    <button class="faq-toggle">
        <span>Quais atividades um voluntário pode realizar?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Os voluntários ajudam com limpeza, alimentação dos animais, divulgação, e eventos de adoção.
    </div>

    <button class="faq-toggle">
        <span>O que é a ONG AUmigos?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        A ONG AUmigos é uma organização dedicada a resgatar, cuidar e encontrar lares para animais abandonados.
    </div>

    <button class="faq-toggle">
        <span>Onde estamos localizados?</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Estamos na Rua dos Pets, 123, São Paulo, SP.
    </div>

    <button class="faq-toggle">
        <span>Posso visitar a ONG</span>
        <svg width="16" height="16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
        </svg>
    </button>
    <div class="faq-answer">
        Sim! Recebemos visitas com agendamento prévio.
    </div>
    <br><BR>
</main>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>

<script>
    const toggles = document.querySelectorAll('.faq-toggle');
    toggles.forEach(toggle => {
        toggle.addEventListener('click', () => {
            const answer = toggle.nextElementSibling;
            answer.style.display = answer.style.display === 'block' ? 'none' : 'block';
            toggle.classList.toggle('open');
        });
    });
</script>
</body>
</html>
