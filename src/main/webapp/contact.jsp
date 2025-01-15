<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contato - ONG AUmigos</title>
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

        input, textarea, select {
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

        .content-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 0 5px;
        }


        #submit-btn:hover {
            background-color: #9C0376;
        }
        .message-container {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #230735;
            color: #fff;
            border-radius: 12px;
            padding: 20px 30px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            z-index: 1000;
            text-align: center;
            font-size: 1.2rem;
        }

        .message-container button {
            background-color: #fff;
            color: #230735;
            border: none;
            border-radius: 8px;
            padding: 8px 16px;
            cursor: pointer;
            margin-top: 15px;
            font-size: 1rem;
        }

        .message-container button:hover {
            background-color: #f0f0f0;
        }

        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .hidden {
            display: none;
        }

        .loader {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 50px;
            height: 50px;
            border: 6px solid #ddd;
            border-top: 6px solid #230735;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            z-index: 1000;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
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
    <h1>Contato</h1> <br><br>
    <div class="content-container">
        <p class="text">
            Ficou com alguma dúvida e quer falar diretamente com a gente? Entre em contato conosco através do nosso e-mail
            <a href="mailto:suporte@aumigos.org">suporte@aumigos.org</a> ou envie uma mensagem para a gente através do formulário abaixo.
            Nós responderemos o mais rápido possível.
            <br><br>
            Sua mensagem será respondida o mais breve possível.
        </p>
    </div>

    <div class="form-container">
        <form id="contact-form">
            <label for="name">Nome:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required>

            <label for="subject">Assunto:</label>
            <input type="text" id="subject" name="subject" required>

            <label for="message">Mensagem:</label>
            <textarea id="message" name="message" required></textarea>

            <button type="button" id="submit-btn">Enviar mensagem</button>
        </form>
    </div>
</main>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>


<div class="loader hidden" id="loader"></div>

<div class="overlay" id="overlay"></div>
<div class="message-container" id="success-message">
    <p>Mensagem enviada com sucesso!</p>
    <button onclick="closeMessage()">Fechar</button>
</div>

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@4/dist/email.min.js"></script>
<script>

    (function() {
        emailjs.init("FLAxz_GTvrzocdjti");
    })();

    document.getElementById('submit-btn').addEventListener('click', () => {
        const loader = document.getElementById('loader');
        loader.classList.remove('hidden');

        const formData = {
            from_name: document.getElementById('name').value,
            reply_to: document.getElementById('email').value,
            subject: document.getElementById('subject').value,
            message: document.getElementById('message').value,
        };

        emailjs.send("service_fna0qpb", "template_rr634fc", formData)
            .then((response) => {
                loader.classList.add('hidden');
                showMessage();
            })
            .catch((error) => {
                loader.classList.add('hidden');
                alert("Erro ao enviar mensagem.");
                console.error("Erro:", error);
            });
    });

    function showMessage() {
        document.getElementById('overlay').style.display = 'block';
        document.getElementById('success-message').style.display = 'block';
    }

    function closeMessage() {
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('success-message').style.display = 'none';
    }
</script>

</body>

</html>
