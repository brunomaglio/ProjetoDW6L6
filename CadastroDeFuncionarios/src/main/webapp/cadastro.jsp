<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Funcionário</title>
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
        input[type="text"], input[type="email"], input[type="tel"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
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
    </style>
</head>
<body>

    <h1>Cadastro de Funcionário</h1>
    <div class="form-container">
        <form action="FuncionarioServlet" method="post">
            <div class="form-group">
                <label for="nome">Nome Completo</label>
                <input type="text" id="nome" name="nome" required>
            </div>
            <div class="form-group">
                <label for="cpf">CPF</label>
                <input type="text" id="cpf" name="cpf" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email">
            </div>
            <div class="form-group">
                <label for="telefone">Telefone</label>
                <input type="tel" id="telefone" name="telefone">
            </div>
            <div class="form-group">
                <label for="endereco">Endereço</label>
                <input type="text" id="endereco" name="endereco">
            </div>
            <div class="form-group">
                <label for="cargo">Cargo</label>
                <input type="text" id="cargo" name="cargo" required>
            </div>
            <div class="form-group">
                <label for="salario">Salário</label>
                <input type="number" id="salario" name="salario" step="0.01" required>
            </div>
            <input type="hidden" name = "action" value ="add">
            <button type="submit" class="button">Cadastrar Funcionário</button>
        </form>
    </div>
    
    <%
        if (request.getMethod().equals("POST")) {
            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");
            String cargo = request.getParameter("cargo");
            double salario = Double.parseDouble(request.getParameter("salario"));

            // Simulando o cadastro do funcionário, você pode adicionar o código de persistência aqui
            // Exemplo: FuncionárioDAO.cadastrarFuncionario(nome, dataNascimento, cpf, email, telefone, endereco, cargo, salario);

            // Se o cadastro foi realizado com sucesso, redireciona para a página de sucesso
            response.sendRedirect("sucesso.jsp");
        }
    %>

</body>
</html>