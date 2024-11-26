<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Registro de animal</title>
</head>
<body>
<form action="animalRegister" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="0" required><br><br>

    <label for="name">Nome:</label>
    <input type="text" name="name" id="name" required><br><br>

    <label for="type">Espécie:</label>
    <select name="type" id="type" required>
        <option value="">Selecione</option>
        <option value="CACHORRO">Cachorro</option>
        <option value="GATO">Gato</option>
    </select><br><br>

    <label for="breed">Raça:</label>
    <input type="text" name="breed" id="breed" required><br><br>

    <label for="gender">Sexo:</label>
    <select name="gender" id="gender" required>
        <option value="">Selecione</option>
        <option value="MASCULINO">Masculino</option>
        <option value="FEMININO">Feminino</option>
    </select><br><br>

    <label for="size">Porte:</label>
    <select name="size" id="size" required>
        <option value="">Selecione</option>
        <option value="PEQUENO">Pequeno</option>
        <option value="MEDIO">Médio</option>
        <option value="GRANDE">Grande</option>
    </select><br><br>

    <label for="age">Idade (em anos):</label>
    <input type="number" name="age" id="age" required><br><br>

    <label for="weight">Peso (em kg):</label>
    <input type="number" id="weight" name="weight" step="0.1" min="0" required><br><br>

    <label for="castrated">Castrado:</label>
    <input type="checkbox" id="castrated" name="castrated"><br><br>

    <label for="image">Imagem:</label>
    <input type="file" id="image" name="image" accept="image/*" required><br><br>

    <button type="submit">Enviar</button>
</form>
</body>
</html>
