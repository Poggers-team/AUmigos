<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adotar Pet</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Fredoka+One&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f5f7;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 0;
        }

        .container {
            display: flex;
            width: 100%;
            height: 100vh;
        }

        .sidebar {
            position: relative;
            background: linear-gradient(to top, rgba(35, 7, 53, 1), rgba(35, 7, 53, 0)); /* Degradê roxo */
            color: #fff;
            width: 35%;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            overflow: hidden;
            padding: 30px;
        }

.sidebar::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(to top, rgba(35, 7, 53, 1) 0%, rgba(35, 7, 53, 0.01) 50%); /* Degradê até a metade */
    background-color: rgba(35, 7, 53, 0.7);
    z-index: 1;
}

.animal-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    z-index: 0;
}

.sidebar h1 {
    position: absolute;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 2;
    font-family: 'Fredoka One', cursive;
    font-size: 3.5rem;
    text-align: center;
    margin: 0;
    width: 90%;
}

.info-container {
    position: absolute;
    bottom: 30px;
    left: 50%;
    transform: translateX(-50%);
    width: 90%;
    text-align: center;
    z-index: 2;
}

.info-container p {
    font-size: 1.2rem;
    font-weight: bold;
    color: #e2e2e2;
    margin: 5px 0;
}


.info-container p strong {
    font-weight: bold;
}

.info-container p {
    font-size: 1.5rem;
    font-weight: normal;
    color: #e2e2e2;
    margin: 5px 0;
    text-align: left;
    margin-left: 25%;
}

        .form-container {
            width: 65%;
            background-color: #f4f5f7;
            padding: 150px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
        }

        .form-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #6c6c6c;
            background-color: #ece5f0;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .form-step {
            display: none;
        }

        .form-step.active {
            display: block;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 1rem;
            font-weight: bold;
            margin-bottom: 10px;
            display: block;
        }

        .form-group select,
        .form-group input[type="file"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            position: absolute;
            bottom: 40px;
            left: 150px;
            right: 150px;
        }

        .btn {
            text-decoration: none;
            padding: 12px 20px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-back {
            background-color: #fff;
            color: #230735;
            border: 2px solid #230735;
            text-align: left;
        }

        .btn-back:hover {
            background-color: #f0f0f0;
        }

        .btn-next {
            background-color: #230735;
            color: #fff;
            border: none;
            text-align: right;
        }

        .btn-next:hover {
            background-color: #7a025b;
        } .form-instructions {
              font-size: 0.9rem;
              color: #6c6c6c;
              background-color: #f2e8f5;
              padding: 15px;
              border-radius: 8px;
              margin-bottom: 20px;
              text-align: center;
          }

        .upload-area {
            border: 2px dashed #c3b2d5;
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            background-color: #f7edf8;
            cursor: pointer;
        }

        .upload-placeholder {
            font-size: 0.9rem;
            color: #6c6c6c;
        }

        .upload-placeholder span {
            display: block;
            margin-top: 10px;
            font-size: 0.8rem;
            color: #9e9e9e;
        }

        .upload-area:hover {
            border-color: #7a025b;
        }

        #image {
            display: none; /
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group input[type="number"],
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            background-color: #fff;
            color: #333;
        }

        .form-group input[type="text"]::placeholder {
            color: #9e9e9e;
            font-size: 0.9rem;
        }

        .form-group input[type="number"]::placeholder {
            color: #9e9e9e;
            font-size: 0.9rem;
        }

        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            resize: none;
            background-color: #fff;
            color: #333;
        }

        .form-group textarea::placeholder {
            color: #9e9e9e;
            font-size: 0.9rem;
        }

        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 10px;
        }

        .checkbox-group label {
            background-color: #f7edf8;
            color: #6c6c6c;
            padding: 10px 15px;
            border: 1px solid #c3b2d5;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            display: inline-block;
            user-select: none;
            transition: background-color 0.3s, color 0.3s, border-color 0.3s;
        }

        .checkbox-group input[type="checkbox"] {
            display: none;
        }

        .checkbox-group input[type="checkbox"]:checked + label {
            background-color: #7a025b;
            color: #fff;
            border-color: #7a025b;
        }

        .checkbox-group label:hover {
            background-color: #e8d4ec;
            border-color: #7a025b;
        }


        .checkbox-group label.selected {
            background-color: #7a025b;
            color: #fff;
            border-color: #7a025b;
        }

        input[type="radio"] {
            accent-color: #7a025b;
        }

        .form-group label input[type="radio"] {
            margin-right: 10px;
        }

        .info-container h2 {
            font-size: 30px;
            margin-bottom: 16px;
        }

    </style>

    <link rel="icon" href="assets/img/favicon.png">
</head>
<body>
    <div class="container">

        <div class="sidebar">
            <h1>${animal.name}</h1>
            <img src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}" class="animal-image">
            <div class="info-container">
            <h2>Características:</h2>
            <p><b>• Gênero:</b>
                <c:if test="${animal.gender == 'MACHO'}">
                    Macho
                </c:if>
                <c:if test="${animal.gender == 'FEMEA'}">
                    Fêmea
                </c:if>
            </p>

            <p><b>• Porte:</b>
                <c:if test="${animal.size == 'PEQUENO'}">
                    Pequeno
                </c:if>
                <c:if test="${animal.size == 'MEDIO'}">
                    Médio
                </c:if>
                <c:if test="${animal.size == 'GRANDE'}">
                    Grande
                </c:if>
            </p>

            <p><b>• Idade:</b> ${animal.age}</p>
        </div>
        </div>
        

    <div class="form-container">
        <form id="multiStepForm" action="FrontController?action=animalUpdate" method="POST" enctype="multipart/form-data">
            <input type="hidden" id="animal-id" name="animal-id" value="${animal.id}">
            <!-- Etapa 1 -->
            <div class="form-step active">
                <h1>Precisamos te conhecer!</h1>
                <br>
                <p class="form-title">Como você se chama?</p>
                <div class="form-group">
                    <label for="name">Nome completo:</label>
                    <input type="text" id="name" name="name" placeholder="Digite seu nome..." required>
                </div>
                <p class="form-title">Somente maiores de 21 anos podem adotar, ok?</p>
                <div class="form-group">
                    <label for="age">Idade:</label>
                    <input type="number" id="age" name="age" placeholder="Digite sua idade..." required>
                </div>
                <p class="form-title">Essencial para mantermos a comunicação com você!</p>
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" name="email" placeholder="Digite seu e-mail..." required>
                </div>
            </div>

            <div class="form-step">
                <h1>Precisamos te conhecer!</h1>
                <br>
                <div class="form-group">
                    <label for="zipcode">CEP:</label>
                    <input type="text" id="zipcode" name="zipcode" placeholder="Digite seu CEP..." max="10" required>
                </div>
                <p class="form-title">(Rua, número, bairro, cidade, estado)</p>
                <div class="form-group">
                    <label for="address">Endereço:</label>
                    <input type="text" id="address" name="address" placeholder="Digite seu endereço..." required>
                </div>
                <p class="form-title">Para estabelecermos um contato!</p>
                <div class="form-group">
                    <label for="tel">Telefone:</label>
                    <input type="tel" id="tel" name="tel" placeholder="Digite seu telefone..." max="8" required>
                </div>
            </div>

            <div class="form-step">
                <h1>Fale sobre seu lar!</h1>
                <br>
                <div class="form-group">
                    <label>O animal irá morar em:</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="residence" value="CASA" required style="margin-right: 10px; font-weight: 100;"> Casa
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="residence" value="CASA_CONDOMINIO" style="margin-right: 10px; font-weight: 100;"> Casa em condomínio
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="residence" value="APARTAMENTO" style="margin-right: 10px; font-weight: 100;"> Apartamento
                        </label>
                    </div>
                </div>
            
                <div class="form-group">
                    <label>Sua casa possui portão automático?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="automaticGate" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="automaticGate" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
            
                <div class="form-group">
                    <label>Sua casa possui piscina?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="pool" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="pool" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
            
                <div class="form-group">
                    <label>Sua casa possui rede nas janelas?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="windowNet" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="windowNet" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>

                <p class="form-title">Caso você tenha algo a mais para nos falar, nos conte agora!</p>
                <div class="form-group">
                    <label for="comments">Comentários:</label>
                    <input type="text" id="comments" name="comments" required>
                </div>
            </div>
            
            <div class="form-step">
                <h1>Fale sobre sua relação com outros animais!</h1>
                <br>
                <div class="form-group">
                    <label>Existem outros animais na casa? Se sim, quantos?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsInHouse" value="0" required style="margin-right: 10px; font-weight: 100;"> 0
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsInHouse" value="1" style="margin-right: 10px; font-weight: 100;"> 1
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsInHouse" value="2" style="margin-right: 10px; font-weight: 100;"> 2
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsInHouse" value="3" style="margin-right: 10px; font-weight: 100;"> 3
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsInHouse" value="4" style="margin-right: 10px; font-weight: 100;"> 4 ou mais
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="animalsExperience">Como foram suas experiências com outros animais?</label>
                    <input type="text" id="animalsExperience" name="animalsExperience" required>
                </div>

                <div class="form-group">
                    <label for="animalPlace">O animal irá viver no quintal ou dentro de casa?</label>
                    <input type="text" id="animalPlace" name="animalPlace" required>
                </div>

                <div class="form-group">
                    <label>Você será o responsável pelo animal adotado?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalResponsible" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalResponsible" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Você está ciente dos custos relacionados ao animal?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="awareOfCosts" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="awareOfCosts" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-step">
                <h1>Qual a rotina da sua casa?</h1>
                <br>
                <div class="form-group">
                    <label>Quantas outras pessoas moram com você?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleInHouse" value="0" required style="margin-right: 10px; font-weight: 100;"> 0
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleInHouse" value="1" style="margin-right: 10px; font-weight: 100;"> 1
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleInHouse" value="2" style="margin-right: 10px; font-weight: 100;"> 2
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleInHouse" value="3" style="margin-right: 10px; font-weight: 100;"> 3
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleInHouse" value="4" style="margin-right: 10px; font-weight: 100;"> 4 ou mais
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Essas pessoas estão cientes e concordam com a adoção?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleAdoption" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peopleAdoption" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Existem crianças que frequentam sua casa?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="childrenInHouse" value="true" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="childrenInHouse" value="false" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>

                <p class="form-title">Um animal não suporta muito tempo sozinho. Ele precisa de você!</p>
                <div class="form-group">
                    <label for="aloneTime">Quanto tempo o animal ficará sozinho?</label>
                    <input type="text" id="aloneTime" name="aloneTime" required>
                </div>
            </div>

            <div class="button-group">
                <button type="button" class="btn btn-back" id="prevBtn" disabled>Voltar</button>
                <button type="button" class="btn btn-next" id="nextBtn">Prosseguir</button>
            </div>
        </form>
    </div>
</div>

<c:if test="${result == 'notRegistered'}">
    <script>
        alert("O telefone cadastrado é inválido.");
    </script>
</c:if>

<script>
    function submitForm(event) {
        event.preventDefault();

        document.getElementById('loader').style.display = 'block';

        const formData = new FormData(document.getElementById('multiStepForm'));

        fetch('frontController?action=animalUpdate', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                document.getElementById('loader').style.display = 'none';

                if (data.success) {
                    document.getElementById('successMessage').style.display = 'block';
                    // Redireciona para a página de sucesso
                    window.location.href = "sucesso.jsp";
                } else {
                    document.getElementById('errorMessage').style.display = 'block';
                }
            })
            .catch(error => {
                document.getElementById('loader').style.display = 'none';
                document.getElementById('errorMessage').style.display = 'block';
            });
    }


    const steps = document.querySelectorAll('.form-step');
    const nextBtn = document.getElementById('nextBtn');
    const prevBtn = document.getElementById('prevBtn');
    let currentStep = 0;

    function updateStep() {
        steps.forEach((step, index) => {
            step.classList.toggle('active', index === currentStep);
        });

        prevBtn.disabled = currentStep === 0;

        if (currentStep === steps.length - 1) {
            nextBtn.textContent = 'Enviar';
            nextBtn.setAttribute('name', 'action');
            nextBtn.setAttribute('value', 'animalRegister');
            nextBtn.setAttribute('type', 'submit');
        } else {
            nextBtn.textContent = 'Prosseguir';
            nextBtn.removeAttribute('name');
            nextBtn.removeAttribute('value');
            nextBtn.setAttribute('type', 'button'); // Define como botão padrão nos outros steps
        }
    }

    nextBtn.addEventListener('click', () => {
        if (!validateStep(currentStep)) {
            return;
        }

        if (currentStep < steps.length - 1) {
            currentStep++;
        } else {
            document.getElementById('multiStepForm').submit();
        }
        updateStep();
    });

    prevBtn.addEventListener('click', () => {
        if (currentStep > 0) {
            currentStep--;
            updateStep();
        } else {
            window.location.href = "FrontController?action=animalList&adopted=false";
        }
    });

    function validateStep(stepIndex) {
        const currentStepFields = steps[stepIndex].querySelectorAll('input, select, textarea');
        let isValid = true;

        currentStepFields.forEach((field) => {
            const errorMessage = field.nextElementSibling;

            if (errorMessage && errorMessage.classList.contains('error-message')) {
                errorMessage.remove();
            }

            // para idadwe 21 anos
            if (field.id === 'age' && parseInt(field.value, 10) <= 20) {
                isValid = false;

                const errorText = document.createElement('span');
                errorText.textContent = 'Idade deve ser maior ou igual a 21 anos.';
                errorText.classList.add('error-message');
                errorText.style.color = 'purple';
                errorText.style.fontSize = '0.8rem';
                errorText.style.marginTop = '5px';
                errorText.style.display = 'block';
                field.insertAdjacentElement('afterend', errorText);
            }


            if (!field.checkValidity()) {
                isValid = false;

                const errorText = document.createElement('span');
                errorText.textContent = field.validationMessage || 'Campo obrigatório.';
                errorText.classList.add('error-message');
                errorText.style.color = 'Purple';
                errorText.style.fontSize = '0.8rem';
                errorText.style.marginTop = '5px';
                errorText.style.display = 'block';
                field.insertAdjacentElement('afterend', errorText);
            }
        });

        return isValid;
    }

    const style = document.createElement('style');
    style.innerHTML = `
    .error-message {
        color: Purple;
        font-size: 0.8rem;
        margin-top: 5px;
        display: block;
    }
    input:invalid, select:invalid, textarea:invalid {
        border-color: Purple;
    }
    input:valid, select:valid, textarea:valid {
        border-color: green;
    }
`;
    document.head.appendChild(style);
    const fileInput = document.getElementById('image');
    const uploadArea = document.getElementById('uploadArea');
    const uploadPlaceholder = document.getElementById('uploadPlaceholder');

    uploadArea.addEventListener('click', () => {
        fileInput.click();
    });

    fileInput.addEventListener('change', () => {
        if (fileInput.files.length > 0) {
            const fileName = fileInput.files[0].name;
            uploadPlaceholder.innerHTML = `<p>Imagem selecionada: ${fileName}</p>`;
            uploadArea.style.borderColor = '#7a025b';
        }
    });

    uploadArea.addEventListener('dragover', (event) => {
        event.preventDefault();
        uploadArea.style.borderColor = '#7a025b';
        uploadPlaceholder.innerHTML = `<p>Solte o arquivo aqui</p>`;
    });

    uploadArea.addEventListener('dragleave', () => {
        uploadArea.style.borderColor = '#c3b2d5';
        uploadPlaceholder.innerHTML = `<span>Arraste uma imagem nesta área, ou clique para selecionar uma imagem.</span>`;
    });

    uploadArea.addEventListener('drop', (event) => {
        event.preventDefault();
        const files = event.dataTransfer.files;
        if (files.length > 0) {
            fileInput.files = files;
            const fileName = files[0].name;
            uploadPlaceholder.innerHTML = `<p>Imagem selecionada: ${fileName}</p>`;
            uploadArea.style.borderColor = '#7a025b';
        }
    });

    document.querySelectorAll('.checkbox-group input[type="checkbox"]').forEach((checkbox) => {
        checkbox.addEventListener('change', function () {
            const label = this.nextElementSibling;
            if (this.checked) {
                label.classList.add('selected');
            } else {
                label.classList.remove('selected');
            }
        });
    });


</script>
</body>
</html>
