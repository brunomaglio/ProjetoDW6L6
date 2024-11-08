<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login de Administrador</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #f3f4f6;
        }
        h1 {
            color: #333;
        }
        .form-container {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 5px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .error {
            color: #ff0000;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

    <h1>Login de Funcionário</h1>
    <div class="form-container">
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" name="cpf" value="50997229811" required>
            </div>
            <div class="form-group">
                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" value="bruno123" required>
            </div>
             <a href="home.jsp" class="button">Entrar</a>
            
            
        </form>
    </div>

</body>
</html>