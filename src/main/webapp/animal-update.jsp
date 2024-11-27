<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<html>
<head>
    <title>Atualizar Animal</title>
</head>
<body>

<c:if test="${result == 'updated'}">
    Animal atualizado com sucesso.
</c:if>

<form action="animalUpdate" method="post" enctype="multipart/form-data">

    <input type="hidden" name="id" id="id" value="${animal.id}"/>

    <!-- Nome -->
    <label for="name">Nome:</label>
    <input type="text" name="name" id="name" value="${animal.name}" required /><br><br>

    <!-- Raça -->
    <label for="breed">Raça:</label>
    <input type="text" name="breed" id="breed" value="${animal.breed}" required /><br><br>

    <!-- Tipo -->
    <label for="type">Tipo:</label>
    <select class="form-select" name="type" id="type" required>
        <option value="CACHORRO" ${animal.type == 'CACHORRO' ? "selected" : ""}>Cachorro</option>
        <option value="GATO" ${animal.type == 'GATO' ? "selected" : ""}>Gato</option>
    </select><br><br>

    <!-- Gênero -->
    <label for="gender">Gênero:</label>
    <select class="form-select" name="gender" id="gender" required>
        <option value="MASCULINO" ${animal.gender == 'MASCULINO' ? "selected" : ""}>Macho</option>
        <option value="FEMININO" ${animal.gender == 'FEMININO' ? "selected" : ""}>Fêmea</option>
    </select><br><br>

    <!-- Tamanho -->
    <label for="size">Tamanho:</label>
    <select class="form-select" name="size" id="size" required>
        <option value="PEQUENO" ${animal.size == 'PEQUENO' ? "selected" : ""}>Pequeno</option>
        <option value="MEDIO" ${animal.size == 'MEDIO' ? "selected" : ""}>Médio</option>
        <option value="GRANDE" ${animal.size == 'GRANDE' ? "selected" : ""}>Grande</option>
    </select><br><br>

    <!-- Idade -->
    <label for="age">Idade:</label>
    <input type="number" name="age" id="age" value="${animal.age}" required /><br><br>

    <!-- Peso -->
    <label for="weight">Peso (kg):</label>
    <input type="number" step="0.01" name="weight" id="weight" value="${animal.weight}" required /><br><br>

    <!-- Castrado -->
    <label for="castrated">Castrado:</label>
    <input type="checkbox" name="castrated" id="castrated" ${animal.castrated ? "checked" : ""} /><br><br>

    <!-- Adotado -->
    <label for="adopted">Adotado:</label>
    <input type="checkbox" name="adopted" id="adopted" ${animal.adopted ? "checked" : ""} /><br><br>

    <!-- Imagem -->
    <label for="image">Imagem:</label>
    <input type="file" id="image" name="image" accept="image/*"><br><br>

    <!-- Nome do Arquivo -->
    Arquivo original: ${animal.fileName}<br><br>
    <img src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}" style="width:200px;height:auto;" /><br><br>

    <!-- Botão de envio -->
    <button type="submit">Atualizar</button>
</form>

</body>
</html>
