<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.cf.models.Funcionario" %> <!-- Ajuste o pacote para o correto -->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informações dos Funcionários</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            padding: 20px;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .button {
            padding: 5px 10px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
        }
        .button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <h1>Informações dos Funcionários</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>CPF</th>
                <th>Email</th>
                <th>Telefone</th>
                <th>Endereço</th>
                <th>Cargo</th>
                <th>Salário</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Obtendo a lista de funcionários passada pelo servlet
                List<Funcionario> funcionarios = (List<Funcionario>) request.getAttribute("listaFuncionarios");

                if (funcionarios != null && !funcionarios.isEmpty()) {
                    for (Funcionario f : funcionarios) {
            %>
                        <tr>
                            <td><%= f.getIdFuncionario() %></td>
                            <td><%= f.getNome() %></td>
                            <td><%= f.getCpf() %></td>
                            <td><%= f.getEmail() %></td>
                            <td><%= f.getTelefone() %></td>
                            <td><%= f.getEndereco() %></td>
                            <td><%= f.getCargo() %></td>
                            <td>R$ <%= String.format("%.2f", f.getSalario()) %></td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="9">Nenhum funcionário encontrado.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <a href="home.jsp" class="button">Voltar para a Home</a>

</body>
</html>
