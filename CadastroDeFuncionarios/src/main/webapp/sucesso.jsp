<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operação realizada com sucesso!</title>
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
        .message-container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #28a745;
            margin-bottom: 10px;
        }
        p {
            color: #333;
            font-size: 1.1em;
        }
        .button {
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <div class="message-container">
        <h1>Operação realizada com sucesso!!</h1>
        <a href="home.jsp" class="button">Voltar para a Home</a>
    </div>

</body>
</html>