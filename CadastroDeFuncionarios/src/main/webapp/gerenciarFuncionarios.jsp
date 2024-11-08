<%@ page import="java.util.List" %>
<%@ page import="com.web.cf.models.Funcionario" %> <!-- Ajuste o pacote conforme o local real da classe Funcionario -->
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Funcionários</title>
    <style>
    /* Estilos para o corpo */
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
    
    /* Estilos para o título */
    h1 {
        color: #333;
    }
    
    /* Estilos para a tabela */
    table {
        width: 100%;
        max-width: 800px;
        border-collapse: collapse;
        margin: 20px 0;
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
    
    /* Estilos para o container de botões */
    .button-container {
        display: flex;
        flex-direction: column;
        gap: 15px;
        max-width: 400px;
        width: 100%;
    }

    /* Estilos para o botão */
    .button {
        padding: 12px;
        font-size: 1em;
        color: #fff;
        background-color: #007bff;
        text-align: center;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s ease;
        display: inline-block;
    }
    
    .button:hover {
        background-color: #0056b3;
    }
    
    /* Estilos para o modal */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
        align-items: center;
        justify-content: center;
    }
    
    .modal-content {
        background-color: #fefefe;
        padding: 20px;
        border-radius: 5px;
        width: 80%;
        max-width: 600px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        position: relative;
    }
    
    /* Estilo para o botão de fechar no modal */
    .close {
        color: #aaa;
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
        transition: color 0.3s ease;
    }
    
    .close:hover, .close:focus {
        color: black;
        text-decoration: none;
    }
</style>
    <script>
        function openModal(funcionario) {
        	console.log(funcionario.dataNascimento);
            document.getElementById("editModal").style.display = "block";
            document.getElementById("id_funcionario").value = funcionario.idFuncionario;
            document.getElementById("nome").value = funcionario.nome;
            document.getElementById("cpf").value = funcionario.cpf;
            document.getElementById("email").value = funcionario.email;
            document.getElementById("telefone").value = funcionario.telefone;
            document.getElementById("endereco").value = funcionario.endereco;
            document.getElementById("cargo").value = funcionario.cargo;
            document.getElementById("salario").value = funcionario.salario;
        }

        function closeModal() {
            document.getElementById("editModal").style.display = "none";
        }
    </script>
</head>
<body>

    <h1>Gerenciar Funcionários</h1>

    <table>
        <thead>
            <tr>
                <th>Nome</th>
                <th>CPF</th>
                <th>Cargo</th>
                <th>Salário</th>
                <th>Ações</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Funcionario> funcionarios = (List<Funcionario>) request.getAttribute("listaFuncionarios");
                if (funcionarios != null && !funcionarios.isEmpty()) {
                    for (Funcionario f : funcionarios) {
            %>
                        <tr>
                            <td><%= f.getNome() %></td>
                            <td><%= f.getCpf() %></td>
                            <td><%= f.getCargo() %></td>
                            <td>R$ <%= String.format("%.2f", f.getSalario()) %></td>
                            <td>
                                <button onclick='openModal({
                                    idFuncionario: "<%= f.getIdFuncionario() %>",
                                    nome: "<%= f.getNome() %>",
                                    cpf: "<%= f.getCpf() %>",
                                    email: "<%= f.getEmail() %>",
                                    telefone: "<%= f.getTelefone() %>",
                                    endereco: "<%= f.getEndereco() %>",
                                    cargo: "<%= f.getCargo() %>",
                                    salario: "<%= f.getSalario() %>"
                                })' class="button">Editar</button>
                                <a href="FuncionarioServlet?action=delete&id_funcionario=<%= f.getIdFuncionario() %>" class="button" onclick="return confirm('Tem certeza que deseja excluir este funcionário?');">Excluir</a>
                            </td>
                        </tr>
            <%
                    }
                } else {
            %>
                    <tr>
                        <td colspan="5">Nenhum funcionário encontrado.</td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <!-- Modal de edição -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Editar Funcionário</h2>
            <form action="FuncionarioServlet?action=update" method="post">
                <input type="hidden" name="id_funcionario" id="id_funcionario">
                Nome: <input type="text" name="nome" id="nome"><br>
                CPF: <input type="text" name="cpf" id="cpf"><br>
                Email: <input type="email" name="email" id="email"><br>
                Telefone: <input type="text" name="telefone" id="telefone"><br>
                Endereço: <input type="text" name="endereco" id="endereco"><br>
                Cargo: <input type="text" name="cargo" id="cargo"><br>
                Salário: <input type="number" name="salario" id="salario" step="0.01"><br>
                <input type="submit" value="Salvar">
            </form>
        </div>
    </div>

    <a href="home.jsp" class="button">Voltar para a Home</a>

</body>
</html>