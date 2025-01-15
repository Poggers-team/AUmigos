<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cadastro de Pet - Sucesso</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Fredoka+One&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f4f5f7;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
    }

    .success-container {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 50px;
      width: 50%;
      text-align: center;
    }

    .success-title {
      font-family: 'Fredoka One', cursive;
      font-size: 2.5rem;
      color: #7a025b;
      margin-bottom: 20px;
    }

    .success-message {
      font-size: 1.2rem;
      color: #6c6c6c;
      margin-bottom: 30px;
    }

    .success-button {
      background-color: #230735;
      color: #fff;
      padding: 12px 20px;
      border-radius: 8px;
      font-weight: 600;
      font-size: 1rem;
      cursor: pointer;
      transition: background-color 0.3s;
      text-decoration: none;
    }

    .success-button:hover {
      background-color: #7a025b;
    }

    .success-icon {
      font-size: 3rem;
      color: #7a025b;
      margin-bottom: 20px;
    }
  </style>
  <link rel="icon" href="assets/img/favicon.png">
</head>
<body>

<div class="success-container">
  <div class="success-icon">✔️</div>
  <div class="success-title">Cadastro Realizado com Sucesso!</div>
  <div class="success-message">
    Seu anúncio de pet foi cadastrado com sucesso! Agradecemos por contribuir para a adoção responsável de animais. Em breve, o seu pet estará disponível para o painel de adoção.
  </div>
  <a href="home.jsp" class="success-button">Voltar à Página Inicial</a>
</div>

</body>
</html>
