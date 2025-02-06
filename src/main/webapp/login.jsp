<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>AUmigos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="assets/css/login.css" rel="stylesheet">
    <link href="assets/img/favicon.png" rel="icon">

    <style>
        body {
            background-color: #f8f9fa;
        }

        .container.py-5.h-100 {
            background-color: #f8f9fa !important;
            border: none;
            box-shadow: none;
        }

        .login-form {
            border: none;
            box-shadow: none;
        }

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
            padding-top: 90px;
        }

        .main-content {
            max-width: 900px;
            margin: 50px auto;
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

        input[type="text"], textarea, select {
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

        .login-img {
            max-width: 70%;
        }

        @media (max-width: 1366px) {
            .login-img {
                max-width: 60%;
            }
        }

        @media (max-width: 992px) {
            .login-img {
                max-width: 50%;
            }
        }

        @media (max-width: 1200px) {
            .img-container {
                display: none !important;
            }
            .form-container {
                width: 100%;
                max-width: 400px;
                margin: 0 auto;
            }
        }

        @media (max-width: 768px) {
            .form-container h2 {
                font-size: 1.5rem;
            }

            .form-container label,
            .form-container input,
            .form-container p {
                font-size: 0.9rem;
            }
        }

    </style>
</head>

<body>
    <header>
        <%@ include file="components/header.jsp" %>
    </header>
    <section>
<div class="container py-5 h-100">
    <div class="col-lg-6 offset-lg-3 col-sm-12">
        <c:choose>
            <c:when test="${result == 'registered'}">
                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">
                    Usuário cadastrado com sucesso. Faça o login.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                </div>
            </c:when>
            <c:when test="${result == 'loginError'}">
                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">
                    E-mail e/ou senha inválidos.
                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                </div>
            </c:when>
        </c:choose>
    </div>
    <br>
    <div class="row d-flex align-items-center justify-content-center h-100">
        <div class="d-flex flex-wrap w-100">
            <!-- Imagem - Some em telas menores -->
            <div class="col-lg-6 col-md-5 d-flex justify-content-center align-items-center img-container">
                <img src="assets/img/img-login.jpg"
                     class="img-fluid login-img" alt="Imagem de login">
            </div>
            <!-- Formulário -->
            <div class="col-lg-6 col-md-7 col-sm-12 d-flex flex-column justify-content-center px-4 form-container">
                <h2 class="text-center">Entre com sua conta!</h2>
                <br>
                <form action="FrontController" method="post">
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="email">Email:</label>
                        <input type="email" id="email" name="email" class="form-control form-control-lg" required/>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="password">Senha:</label>
                        <input type="password" id="password" name="password" class="form-control form-control-lg" required/>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary w-100" name="action" value="login">Entrar</button>
                </form>
                <br>
                <p class="text-center">Não possui cadastro?
                    <a href="user-register.jsp" class="link-primary">Registre-se!</a>
                </p>
            </div>
        </div>
    </div>
</div>


    </section>
    <br><br>
    <footer>
        <%@ include file="components/footer.jsp" %>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
