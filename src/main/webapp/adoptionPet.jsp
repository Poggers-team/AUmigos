<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Anúncio Pet</title>
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
            background-color: #230735;
            color: #fff;
            padding: 100px;
            width: 35%;
            display: flex;
            flex-direction: column;
        }

        .sidebar h1 {
            font-family: 'Fredoka One', cursive;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .sidebar p {
            font-size: 1rem;
            line-height: 1.8;
            color: #e2e2e2;
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

    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h1>nome do pet</h1>
        <p>
            informações do pet
        </p>
    </div>

    <div class="form-container">
        <form id="multiStepForm" action="FrontController" method="POST" enctype="multipart/form-data">
<%--            <input type="hidden" name="action" value="animalRegister">--%>
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
                    <input type="text" id="age" name="age" placeholder="Digite sua idade..." required>
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
                    <input type="number" id="zipcode" name="zipcode" placeholder="Digite seu nome..." max="8" required>
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
                            <input type="radio" name="automaticGate" value="SIM" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="automaticGate" value="NAO" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
            
                <div class="form-group">
                    <label>Sua casa possui piscina?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="pool" value="SIM" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="pool" value="NAO" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
            
                <div class="form-group">
                    <label>Sua casa possui redinha nas janelas?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="windowNet" value="SIM" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="windowNet" value="NAO" style="margin-right: 10px; font-weight: 100;"> Não
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
                            <input type="radio" name="animalsinhouse" value="0" required style="margin-right: 10px; font-weight: 100;"> 0
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsinhouse" value="1" style="margin-right: 10px; font-weight: 100;"> 1
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsinhouse" value="2" style="margin-right: 10px; font-weight: 100;"> 2
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsinhouse" value="3" style="margin-right: 10px; font-weight: 100;"> 3
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalsinhouse" value="4more" style="margin-right: 10px; font-weight: 100;"> 4 ou mais
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label for="animalsexperience">Como foram suas experiências com outros animais?</label>
                    <input type="text" id="animalsexperience" name="animalsexperience" required>
                </div>

                <div class="form-group">
                    <label for="animalsexperience">O animal irá viver no quintal ou dentro de casa?</label>
                    <input type="text" id="animalsexperience" name="animalsexperience" required>
                </div>

                <div class="form-group">
                    <label>Você será o responsável pelo animal adotado?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalresponse" value="0" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalresponse" value="1" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Você está ciente dos custos relacionados ao animal?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalcost" value="0" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="animalcost" value="1" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
            </div>

            <!-- Etapa 7 -->
            <div class="form-step">
                <h1>Qual a rotina da sua casa?</h1>
                <br>
                <div class="form-group">
                    <label>Quantas outras pessoas moram com você?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesinhouse" value="0" required style="margin-right: 10px; font-weight: 100;"> 0
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesinhouse" value="1" style="margin-right: 10px; font-weight: 100;"> 1
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesinhouse" value="2" style="margin-right: 10px; font-weight: 100;"> 2
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesinhouse" value="3" style="margin-right: 10px; font-weight: 100;"> 3
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesinhouse" value="4more" style="margin-right: 10px; font-weight: 100;"> 4 ou mais
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label>Essas pessoas estão cientes e concordam com a adoção?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesadoption" value="0" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="peoplesadoption" value="1" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Existem crianças que frequentam sua casa?</label>
                    <div style="display: block;">
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="kidsinhouse" value="0" required style="margin-right: 10px; font-weight: 100;"> Sim
                        </label>
                        <label style="display: flex; align-items: center; margin-bottom: 8px; font-weight: 100;">
                            <input type="radio" name="kidsinhouse" value="1" style="margin-right: 10px; font-weight: 100;"> Não
                        </label>
                    </div>
                </div>

                <p class="form-title">Um animal não suporta muito tempo sozinho. Ele precisa de você!</p>
                <div class="form-group">
                    <label for="comments">Quanto tempo o animal ficará sozinho?</label>
                    <input type="text" id="comments" name="comments" required>
                </div>
            </div>

            <div class="button-group">
                <button type="button" class="btn btn-back" id="prevBtn" disabled>Voltar</button>
                <button type="button" class="btn btn-next" id="nextBtn">Prosseguir</button>
            </div>
        </form>
    </div>
</div>

<script>
    function submitForm(event) {
        event.preventDefault();

        document.getElementById('loader').style.display = 'block';

        const formData = new FormData(document.getElementById('multiStepForm'));

        fetch('frontController?action=animalRegister', {
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
        }
        updateStep();
    });

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
