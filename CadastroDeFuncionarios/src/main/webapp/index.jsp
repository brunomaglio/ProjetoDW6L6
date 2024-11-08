<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Inicial</title>
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
        p {
            font-size: 1.1em;
            color: #555;
        }
        .buttons {
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            padding: 12px 24px;
            margin: 0 10px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h1>Bem-vindo ao Sistema</h1>
    <p>Escolha uma opção para continuar:</p>

    <div class="buttons">
        <a href="login.jsp" class="button">Login</a>
    </div>

</body>
</html>