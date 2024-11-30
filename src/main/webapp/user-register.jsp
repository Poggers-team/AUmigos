<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
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

        
    </style>
</head>
<header>
    <%@ include file="components/header.jsp" %>
</header>

<body>

<a class="back" href="login.jsp">
    <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="white" class="bi bi-arrow-left" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
    </svg>
    Retornar ao login
</a>

<section class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <div class="container py-50 px-4 bg-white rounded shadow-lg" id="formtable">
        <div class="col-lg-8 col-md-10 col-sm-12 mx-auto">
            <c:if test="${result == 'notRegistered'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    E-mail já cadastrado. Tente novamente.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="text-center mb-4">
                <h2 class="display-6">Registre-se</h2>
            </div>

            <form action="FrontController" method="post" id="form1">
                <div class="form-outline mb-4">
                    <label class="form-label" for="name">Nome completo*</label>
                    <input type="text" id="name" name="name" class="form-control form-control-lg" minlength="3" maxlength="50" required />
                    <span id="0"></span>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="email">E-mail*</label>
                    <input type="email" id="email" name="email" class="form-control form-control-lg" required />
                    <span id="1"></span>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="password">Senha*</label>
                    <input type="password" id="password" name="password" class="form-control form-control-lg" minlength="6" maxlength="12" required />
                    <span id="2"></span>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="confirmPassword">Confirmação de Senha*</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="form-control form-control-lg" minlength="6" maxlength="12" required />
                    <span id="3"></span>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="dateOfBirth">Data de Nascimento*</label>
                    <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-control form-control-lg" max="2012-12-31" required />
                    <span id="4"></span>
                </div>

                <div class="form-outline mb-4">
                    <label class="form-label" for="gender">Gênero*</label>
                    <select id="gender" name="gender" class="form-select form-control-lg" required>
                        <option value="" selected>Selecione</option>
                        <option value="MASCULINO">Masculino</option>
                        <option value="FEMININO">Feminino</option>
                        <option value="OUTRO">Outro</option>
                        <option value="PREFIRO_NAO_DIZER">Prefiro não dizer</option>
                    </select>
                    <span id="5"></span>
                </div>

                <div class="d-grid gap-1 mb-3">
                    <button type="submit" class="btn-login" name="action" value="userRegister">Salvar</button>
                </div>
                <br>
            </form>
        </div>
    </div>
</section>
<br><br><br><br><br><br><br><br>
<footer>
    <%@ include file="components/footer.jsp" %>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="assets/js/userRegister.js"></script>
</body>
</html>
