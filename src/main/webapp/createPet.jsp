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
            justify-content: center;
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


    </style>
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="sidebar">
        <h1>Criar Anúncio Pet</h1>
        <p>
            Crie gratuitamente seu anúncio para acessar o Painel de Adoção do pet, onde você poderá acessar
            ferramentas de divulgação com eficácia comprovada no Brasil inteiro.
        </p>
    </div>

    <div class="form-container">
        <form id="multiStepForm" action="FrontController" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="animalRegister">
            <!-- Etapa 1 -->
            <div class="form-step active">
                <p class="form-title">Vamos começar com algumas informações básicas.</p>
                <div class="form-group">
                    <label for="type">Espécie</label>
                    <select id="type" name="type" required>
                        <option value="CACHORRO">Cachorro</option>
                        <option value="GATO">Gato</option>
                        <option value="OUTRO">Outro</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="gender">Gênero</label>
                    <select id="gender" name="gender" required>
                        <option value="MACHO">Macho</option>
                        <option value="FEMEA">Fêmea</option>
                    </select>
                </div>
            </div>

            <div class="form-step">
                <p class="form-title">Adicione uma foto do pet</p>
                <div class="form-instructions">
                   Usaremos essa foto em todas as ferramentas de divulgação, como cartazes, posts em redes sociais e anúncios.
                </div>
                <div class="form-group">
                    <label for="image">Foto do pet</label>
                    <div class="upload-area" id="uploadArea">
                        <input type="file" id="image" name="image" accept="image/*" required>
                        <div class="upload-placeholder" id="uploadPlaceholder">
                            <span>Arraste uma imagem nesta área, ou clique para selecionar uma imagem.</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="form-step">
                <p class="form-title">Preencha as informações adicionais do pet</p>
                <div class="form-group">
                    <label for="breed">Raça</label>
                    <input type="text" id="breed" name="breed" placeholder="Digite a raça do pet" required>
                </div>
                <div class="form-group">
                    <label for="color">Cor</label>
                    <input type="text" id="color" name="color" placeholder="Digite a cor do pet" required>
                </div>
                <div class="form-group">
                    <label for="age">Idade</label>
                    <input type="number" id="age" name="age" placeholder="Digite a idade do pet" required>
                </div>
                <div class="form-group">
                    <label for="size">Porte</label>
                    <select id="size" name="size" required>
                        <option value="PEQUENO">Pequeno</option>
                        <option value="MEDIO">Médio</option>
                        <option value="GRANDE">Grande</option>
                    </select>
                </div>
            </div>

            <div class="form-step">
                <p class="form-title">Adicione mais informações sobre o pet</p>
                <div class="form-group">
                    <label for="name">Nome do pet <span style="font-size: 0.8rem; color: #9e9e9e;">(Opcional)</span></label>
                    <input type="text" id="name" name="name" placeholder="Deixe em branco se não tiver nome">
                </div>
                <div class="form-group">
                    <label for="story">História do pet <span style="font-size: 0.8rem; color: #9e9e9e;">(Opcional)</span></label>
                    <textarea id="story" name="story" rows="5" placeholder="Conte a história do pet, como ele foi encontrado, como está sendo cuidado, etc."></textarea>
                </div>
            </div>

            <div class="form-step">
                <p class="form-title">Muito bem! Agora adicione características que você sabe sobre o pet.</p>
                <div class="form-instructions">
                    Escolha as características que melhor descrevem o pet.
                </div>

                <div class="form-group">
                    <label>Cuidados Veterinários</label>
                    <div class="checkbox-group">
                        <input type="checkbox" id="vaccinated" name="vaccinated" value="Vacinado">
                        <label for="vaccinated">Vacinado</label>

                        <input type="checkbox" id="castrated" name="castrated" value="Castrado">
                        <label for="castrated">Castrado</label>

                        <input type="checkbox" id="dewormed" name="dewormed" value="Vermifugado">
                        <label for="dewormed">Vermifugado</label>

                    </div>
                </div>


                <div class="form-group">
                    <label>Temperamento</label>
                    <div class="checkbox-group">
                        <input type="checkbox" id="docil" name="temperament" value="Dócil">
                        <label for="docil">Dócil</label>

                        <input type="checkbox" id="agressivo" name="temperament" value="Agressivo">
                        <label for="agressivo">Agressivo</label>

                        <input type="checkbox" id="brincalhao" name="temperament" value="Brincalhão">
                        <label for="brincalhao">Brincalhão</label>

                        <input type="checkbox" id="calmo" name="temperament" value="Calmo">
                        <label for="calmo">Calmo</label>

                        <input type="checkbox" id="sociavel" name="temperament" value="Sociável">
                        <label for="sociavel">Sociável</label>

                        <input type="checkbox" id="timido" name="temperament" value="Tímido">
                        <label for="timido">Tímido</label>

                        <input type="checkbox" id="independente" name="temperament" value="Independente">
                        <label for="independente">Independente</label>

                        <input type="checkbox" id="carente" name="temperament" value="Carente">
                        <label for="carente">Carente</label>
                    </div>
                </div>

                <!-- Socialização -->
                <div class="form-group">
                    <label>Socialização</label>
                    <div class="checkbox-group">
                        <input type="checkbox" id="criancas" name="socialization" value="Sociável com crianças">
                        <label for="criancas">Sociável com crianças</label>

                        <input type="checkbox" id="gatos" name="socialization" value="Sociável com gatos">
                        <label for="gatos">Sociável com gatos</label>

                        <input type="checkbox" id="caes" name="socialization" value="Sociável com cães">
                        <label for="caes">Sociável com cães</label>

                        <input type="checkbox" id="estranhos" name="socialization" value="Sociável com estranhos">
                        <label for="estranhos">Sociável com estranhos</label>
                    </div>
                </div>
            </div>

            <!-- Etapa 6 -->
            <div class="form-step">
                <p class="form-title">Agora, precisamos saber onde o pet se encontra atualmente.</p>
                <div class="form-instructions">
                    Se você não encontrar o endereço, forneça um endereço próximo.
                </div>
                <div class="form-group">
                    <label for="city">Cidade</label>
                    <input type="text" id="city" name="city" placeholder="Insira o endereço onde o pet se encontra" required><br><br>
                    <label for="address">Endereço</label>
                    <input type="text" id="address" name="address" placeholder="Insira o endereço onde o pet se encontra" required>
                </div>
            </div>

            <!-- Etapa 7 -->
            <div class="form-step">
                <p class="form-title">Agora, precisamos saber como entrar em contato com você.</p>
                <div class="form-instructions">
                    Forneça seus dados de contato para que possamos ajudar em casos de dúvidas ou para os interessados entrarem em contato.
                </div>
                <div class="form-group">
                    <label for="contactName">Seu Nome</label>
                    <input type="text" id="contactName" name="contactName" placeholder="Digite seu nome" required><br><br>

                    <label for="contactEmail">Seu Email</label>
                    <input type="email" id="contactEmail" name="contactEmail" placeholder="Digite seu email" required><br><br>

                    <label for="contactPhone">Seu Telefone</label>
                    <input type="tel" id="contactPhone" name="contactPhone" placeholder="Digite seu telefone com DDD" required>
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
        nextBtn.textContent = currentStep === steps.length - 1 ? 'Enviar' : 'Prosseguir';
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
