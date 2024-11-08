package com.web.cf.dto;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.web.cf.models.Funcionario;
import com.web.cf.utils.BDFactory;

public class FuncionarioDTO {
	 private Connection conn;

	    // Método para salvar um funcionário
	    public void save(Funcionario funcionario) throws Exception {
	        String sql = "INSERT INTO funcionarios(nome, cpf, email, telefone, endereco, cargo, salario) VALUES (?, ?, ?, ?, ?, ?, ?)";
	        
	        try {
	            conn = BDFactory.getConnection();
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, funcionario.getNome());
	            stmt.setString(2, funcionario.getCpf());
	            stmt.setString(3, funcionario.getEmail());
	            stmt.setString(4, funcionario.getTelefone());
	            stmt.setString(5, funcionario.getEndereco());
	            stmt.setString(6, funcionario.getCargo());
	            stmt.setDouble(7, funcionario.getSalario());
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new Exception("Erro ao inserir o funcionário: " + e);
	        }
	    }

	    // Método para atualizar os dados de um funcionário
	    public void update(Funcionario funcionario) throws Exception {
	        String sql = "UPDATE funcionarios SET nome = ?, cpf = ?, email = ?, telefone = ?, endereco = ?, cargo = ?, salario = ? WHERE id_funcionario = ?";
	        
	        try {
	            conn = BDFactory.getConnection();
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, funcionario.getNome());
	            stmt.setString(2, funcionario.getCpf());
	            stmt.setString(3, funcionario.getEmail());
	            stmt.setString(4, funcionario.getTelefone());
	            stmt.setString(5, funcionario.getEndereco());
	            stmt.setString(6, funcionario.getCargo());
	            stmt.setDouble(7, funcionario.getSalario());
	            stmt.setInt(8, funcionario.getIdFuncionario());
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new Exception("Erro ao atualizar o funcionário: " + e);
	        }
	    }

	    // Método para deletar um funcionário
	    public void delete(int idFuncionario) throws Exception {
	        String sql = "DELETE FROM funcionarios WHERE id_funcionario = ?";
	        
	        try {
	            conn = BDFactory.getConnection();
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, idFuncionario);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            throw new Exception("Erro ao deletar o funcionário: " + e);
	        }
	    }

	    
	    public List<Funcionario> getAllFuncionarios() throws Exception {
	        List<Funcionario> funcionarios = new ArrayList<>();
	        String sql = "SELECT * FROM funcionarios";

	        try {
	            conn = BDFactory.getConnection();
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            ResultSet rs = stmt.executeQuery();

	            while (rs.next()) {
	                Funcionario funcionario = new Funcionario(
	                    rs.getInt("id_funcionario"),
	                    rs.getString("nome"),
	                    rs.getString("cpf"),
	                    rs.getString("email"),
	                    rs.getString("telefone"),
	                    rs.getString("endereco"),
	                    rs.getString("cargo"),
	                    rs.getDouble("salario")
	                );
	                funcionarios.add(funcionario);
	            }
	        } catch (SQLException e) {
	            throw new Exception("Erro ao listar funcionários: " + e);
	        }
	        return funcionarios;
	    }

	    // Método para obter um funcionário pelo ID
	    public Funcionario getFuncionarioById(int idFuncionario) throws Exception {
	        String sql = "SELECT * FROM funcionarios WHERE id_funcionario = ?";

	        try {
	            conn = BDFactory.getConnection();
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setInt(1, idFuncionario);
	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	                return new Funcionario(
	                    rs.getInt("id_funcionario"),
	                    rs.getString("nome"),
	                    rs.getString("cpf"),
	                    rs.getString("email"),
	                    rs.getString("telefone"),
	                    rs.getString("endereco"),
	                    rs.getString("cargo"),
	                    rs.getDouble("salario")
	                );
	            } else {
	                throw new Exception("Funcionário não encontrado");
	            }
	        } catch (SQLException e) {
	            throw new Exception("Erro ao buscar o funcionário: " + e);
	        }
	    }
	}


