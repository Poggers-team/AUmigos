<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seja Voluntário - ONG AUmigos</title>
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

<main class="main-content">
    <img src="assets/icons/pata.svg" alt="Pata ONG AUmigos">
    <h1>Seja Voluntário</h1><br>
    <p>Quer fazer a diferença na vida de centenas de pets? Torne-se um voluntário da ONG AUmigos e ajude-nos a transformar vidas!</p>
    <p>Ser voluntário significa dedicar tempo, amor e habilidades para melhorar as condições dos nossos amigos de quatro patas.</p>
    <br>

    <h2>Preencha o formulário abaixo para se inscrever:</h2><br>
    <div class="form-container">
        <form id="volunteer-form">
            <label for="name">Nome:</label>
            <input type="text" id="name" name="name" placeholder="Digite seu nome completo" required>

            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" placeholder="Digite seu e-mail" required>

            <label for="phone">Telefone:</label>
            <input type="text" id="phone" name="phone" placeholder="Digite seu número de telefone" required>

            <label for="availability">Disponibilidade:</label>
            <select id="availability" name="availability" required>
                <option value="">Selecione...</option>
                <option value="manhã">Manhã</option>
                <option value="tarde">Tarde</option>
                <option value="noite">Noite</option>
                <option value="fim-de-semana">Finais de Semana</option>
            </select>

            <label for="skills">Habilidades ou áreas de interesse:</label>
            <textarea id="skills" name="skills" placeholder="Conte-nos como você pode ajudar"></textarea>

            <button type="button" id="submit-btn">Enviar</button>
        </form>
    </div>
</main>

<footer>
    <%@ include file="components/footer.jsp" %>
</footer>

<script>
    document.getElementById("submit-btn").addEventListener("click", () => {
        alert("Obrigado por se inscrever! Entraremos em contato em breve.");
        document.getElementById("volunteer-form").reset();
    });
</script>

</body>
</html>
