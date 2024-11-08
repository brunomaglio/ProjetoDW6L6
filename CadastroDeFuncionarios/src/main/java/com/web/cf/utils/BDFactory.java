package com.web.cf.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BDFactory {
	 private static final String URL = "jdbc:mysql://localhost:3306/empresa";
	    private static final String USER = "root";
	    private static final String PASSWORD = "root";

	    // O método estático getConnection() aplica o Factory Pattern, pois encapsula o processo de criação de uma conexão
	    public static Connection getConnection() throws SQLException, ClassNotFoundException {
	        try {
	            // A classe DriverManager gerencia as conexões JDBC e retorna uma conexão válida
	        	Class.forName("com.mysql.jdbc.Driver");
	            return DriverManager.getConnection(URL, USER, PASSWORD);
	        } catch (SQLException e) {
	            // Em caso de falha, o erro é lançado para que o código chamador o trate
	            throw new SQLException("Erro ao conectar ao banco de dados: " + e.getMessage());
	        }
	    }
	}

