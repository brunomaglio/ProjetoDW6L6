package com.web.cf.servlet;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.cf.dto.FuncionarioDTO;
import com.web.cf.models.Funcionario;

/**
 * Servlet implementation class FuncionarioServlet
 */
@WebServlet("/FuncionarioServlet")
public class FuncionarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private FuncionarioDTO funcionarioDAO = new FuncionarioDTO();

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        switch (action) {
	            case "add":
				try {
					addFuncionario(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	                break;
	            case "update":
				try {
					updateFuncionario(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	                break;
	            case "delete":
				try {
					deleteFuncionario(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	                break;
	            default:
	                response.sendRedirect("home.jsp");
	        }
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        switch (action) {
	            case "list":
				try {
					listFuncionarios(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	                break;
	            case "edit":
				try {
					showEditForm(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	                break;
	            case "delete":
					try {
						deleteFuncionario(request, response);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		                break;
	            default:
	                response.sendRedirect("home.jsp");
	        }
	    }

	    // Método para adicionar um novo funcionário
	    private void addFuncionario(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        String nome = request.getParameter("nome");
	        String cpf = request.getParameter("cpf");
	        String email = request.getParameter("email");
	        String telefone = request.getParameter("telefone");
	        String endereco = request.getParameter("endereco");
	        String cargo = request.getParameter("cargo");
	        double salario = Double.parseDouble(request.getParameter("salario"));

	        Funcionario funcionario = new Funcionario(0, nome, cpf, email, telefone, endereco, cargo, salario);
	        funcionarioDAO.save(funcionario);

	        response.sendRedirect("sucesso.jsp");
	    }

	    // Método para atualizar informações de um funcionário
	    private void updateFuncionario(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        int idFuncionario = Integer.parseInt(request.getParameter("id_funcionario"));
	        String nome = request.getParameter("nome");
	        String dataNascimentoStr = request.getParameter("data_nascimento");
	        String cpf = request.getParameter("cpf");
	        String email = request.getParameter("email");
	        String telefone = request.getParameter("telefone");
	        String endereco = request.getParameter("endereco");
	        String cargo = request.getParameter("cargo");
	        double salario = Double.parseDouble(request.getParameter("salario"));

	        Funcionario funcionario = new Funcionario(idFuncionario, nome, cpf, email, telefone, endereco, cargo, salario);
	        funcionarioDAO.update(funcionario);

	        response.sendRedirect("sucesso.jsp");
	    }

	    // Método para deletar um funcionário
	    private void deleteFuncionario(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        int idFuncionario = Integer.parseInt(request.getParameter("id_funcionario"));
	        funcionarioDAO.delete(idFuncionario);

	        response.sendRedirect("sucesso.jsp");
	    }

	    // Método para listar todos os funcionários e exibir na página
	    private void listFuncionarios(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        List<Funcionario> listaFuncionarios = funcionarioDAO.getAllFuncionarios();
	        request.setAttribute("listaFuncionarios", listaFuncionarios);
	        if(request.getParameter("screen").toString().equals("gerenciar")) {
	        	request.getRequestDispatcher("gerenciarFuncionarios.jsp").forward(request, response);
	        }else {
	        	request.getRequestDispatcher("informacoesFuncionarios.jsp").forward(request, response);
	        }
	        
	    }

	    // Método para exibir o formulário de edição com informações do funcionário atual
	    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        int idFuncionario = Integer.parseInt(request.getParameter("id_funcionario"));
	        Funcionario funcionario = funcionarioDAO.getFuncionarioById(idFuncionario);
	        request.setAttribute("funcionario", funcionario);
	        request.getRequestDispatcher("editarFuncionario.jsp").forward(request, response);
	    }
	}
