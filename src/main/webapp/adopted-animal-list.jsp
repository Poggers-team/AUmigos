<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions"%>
<html>
<head>
    <title>Animais Adotados</title>
</head>
<body>
<c:if test="${empty animals}">
    <h2>Nenhum animal foi cadastrado.</h2>
</c:if>
<c:if test="${not empty animals}">
    <c:forEach var="animal" items="${animals}">
        id
        ${animal.id}

        nome
        ${animal.name}

        raça
        ${animal.breed}

        espécie
        <c:if test="${animal.type == 'CACHORRO'}">Cachorro</c:if>
        <c:if test="${animal.type == 'GATO'}">Gato</c:if>

        sexo
        <c:if test="${animal.gender == 'MASCULINO'}">Masculino</c:if>
        <c:if test="${animal.gender == 'FEMININO'}">Feminino</c:if>

        porte
        <c:if test="${animal.size == 'PEQUENO'}">Pequeno</c:if>
        <c:if test="${animal.size == 'MEDIO'}">Médio</c:if>
        <c:if test="${animal.size == 'GRANDE'}">Grande</c:if>

        idade
        ${animal.age}

        peso
        ${animal.weight}

        castrado
        <c:if test="${animal.castrated == true}">Sim</c:if>
        <c:if test="${animal.castrated == false}">Não</c:if>

        imagem
        <img src="data:image/jpeg;base64,${animal.image}" alt="${animal.name}" style="width:200px;height:auto;" />

    </c:forEach>
</c:if>
</body>
</html>
