<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Inicial - Sistema de Funcionários</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #333;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            gap: 15px;
            max-width: 400px;
            width: 100%;
        }
        .button {
            padding: 12px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            display: block;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h1>Página Inicial - Sistema de Funcionários</h1>
    <div class="button-container">
        <a href="cadastro.jsp" class="button">Adicionar Novo Funcionário</a>
        <a href="FuncionarioServlet?action=list&screen=gerenciar" class="button">Gerenciar Funcionários</a>
        <a href="FuncionarioServlet?action=list&screen=listar" class="button">Funcionários Cadastrados</a>
        <a href="login.jsp" class="button">Sair</a>
    </div>

</body>
</html>